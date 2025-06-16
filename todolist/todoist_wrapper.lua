local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("cjson")
local utils = require(".utils")

local todoist_wrapper = {}

--- A simple http method that returns a
---@param url string URL to the page
---@param method string An HTTP method.
---@param auth_token string The authorization "Bearer" token.
---@param data table Body or params.
---@return table json_data Pulled information.
function todoist_wrapper.http_request(url, method, auth_token, data)
	local resp = {}
	local _data = data and json.encode(data) or {}
	local r, _ = http.request({
		url = url,
		headers = {
			["Authorization"] = "Bearer " .. auth_token,
		},
		method = method or "GET",
		sink = ltn12.sink.table(resp),
		source = ltn12.source.string(json.encode(_data)),
	})
	if r == nil then
		return {}
	end
	return json.decode(table.concat(resp))
end

--- A function generating parameter string.
---@generic T
---@param t table<string, T> A table containing parameters.
---@return string param_string The generated param suffix.
function todoist_wrapper.generate_params(t)
	local params = ""
	for k, v in pairs(t) do
		params = params .. k .. "=" .. v .. "&"
	end
	return string.sub(params, 1, -2)
end

--- Retrieve project names and ids from the Todoist app.
---@return table data A table containing <name;id> values.
function todoist_wrapper.get_project_ids()
	local data = {}
	for _, v in ipairs(todoist_wrapper.http_request(utils.url_prefix .. "projects", "GET", utils.auth_token, {})) do
		data[v.name] = v.id
	end
	return data
end

--- Retrieve tasks for the given project from the Todoist app.
---@param t table A key-value of parameters.
---@return {content: string, due: string?, id: integer, is_completed: boolean} tasks The result of the query.
function todoist_wrapper.get_tasks(t)
	t = t or {}

	local output = {}
	local params = ""
	if t ~= {} then
		params = "?" .. todoist_wrapper.generate_params(t)
	end
	for _, v in ipairs(todoist_wrapper.http_request(utils.url_prefix .. "tasks" .. params, "GET", utils.auth_token, {})) do
		table.insert(output, { content = v.content, id = v.id, is_completed = v.is_completed })
	end
	return output
end

return todoist_wrapper
