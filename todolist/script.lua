require("cairo_xlib")
require("cairo")
local inspect = require("inspect")
local todoist_api = require(".todoist_wrapper")
local utils = require(".utils")

-- todoist_wrapper

-- utils

--- Sort the table keys.
---@param t table The table with keys to sort.
---@return table sorted_keys An array with sorted keys.
local function sort_keys(t)
	local keys = {}
	for k, _ in pairs(t) do
		table.insert(keys, k)
	end
	table.sort(keys, function(a, b)
		return a < b
	end)
	return keys
end

--- Generate a status dot before an item
---@param status string? A status of an item, expects "good", "warn", and "critical" literals.
---@param w integer An x coordinate value.
---@param h integer An y coordinate value
local function generate_colored_dot(status, w, h)
	local color = utils.colors.blue
	if status == "good" then
		color = utils.colors.green
	elseif status == "warn" then
		color = utils.colors.yellow
	elseif status == "critical" then
		color = utils.colors.red
	end

	cairo_set_source_rgba(cr, color.r / 255, color.g / 255, color.b / 255, 1)
	cairo_arc(
		cr,
		w + utils.circle_values.margin + utils.circle_values.radius / 2,
		h - utils.circle_values.radius / 2,
		utils.circle_values.radius,
		utils.circle_values.angle1,
		utils.circle_values.angle2
	)
	cairo_close_path(cr)
	cairo_fill(cr)
end

--- Display an item content.
---@param task {content: string, due: string?, id: integer, is_completed: boolean} An item content.
---@param extents cairo_text_extents_t Extent object.
---@param line_num integer Index of the line
---@return integer new_line_number Updated line number.
local function display_item(task, extents, line_num)
	-- TODO: resolve status
	generate_colored_dot(nil, 0, line_num)
	cairo_set_font_size(cr, utils.small_font_size)
	cairo_set_source_rgba(cr, 1, 1, 1, 1)
	cairo_text_extents(cr, task.content, extents)
	cairo_move_to(cr, utils.circle_values.margin * 2 + utils.circle_values.radius, line_num)
	cairo_show_text(cr, task.content)
	return line_num + utils.small_offset
end

--- Display a title of the project.
---@param title string A title content.
---@param extents cairo_text_extents_t Extent object.
---@param line_num integer Index of the line.
---@return integer new_line_number Updated line number.
local function display_title(title, extents, line_num)
	local midx = conky_window.width / 2
	cairo_set_font_size(cr, utils.big_font_size)
	cairo_set_source_rgba(cr, 1, 1, 1, 1)
	cairo_text_extents(cr, title, extents)
	cairo_move_to(cr, midx - (extents.width / 2 + extents.x_bearing), line_num + 10)
	cairo_show_text(cr, title)

	line_num = line_num + utils.big_offset
	cairo_move_to(cr, 0, line_num - 5)
	cairo_line_to(cr, conky_window.width, line_num - 5)
	cairo_set_line_width(cr, 1)
	cairo_stroke(cr)
	return line_num + 12
end

local function generate_content(extents)
	cairo_select_font_face(cr, "Ubuntu", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
	local extents = cairo_text_extents_t:create()
	tolua.takeownership(extents)

	local line_num = utils.big_offset
	local projects = todoist_api.get_project_ids()
    if projects == {} then
        line_num = display_title("Nothing to display", extents, line_num)
        return
    end
	for _, name in ipairs(sort_keys(projects)) do
		line_num = display_title(name, extents, line_num)
		for _, task in ipairs(todoist_api.get_tasks({ project_id = projects[name] })) do
			line_num = display_item(task, extents, line_num)
		end
	end
end

function conky_main()
	if conky_window == nil then
		return
	end
	local surface = cairo_xlib_surface_create(
		conky_window.display,
		conky_window.drawable,
		conky_window.visual,
		conky_window.width,
		conky_window.height + 200
	)

	cr = cairo_create(surface)
	generate_content()

	cairo_destroy(cr)
	cairo_surface_destroy(surface)
	cr = nil
end
