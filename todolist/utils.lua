local math = require("math")
local utils = {
    auth_token = "<auth-token>",
    url_prefix = "https://api.todoist.com/rest/v2/",
    small_font_size = 15,
    small_offset = 20,
    big_font_size = 20,
    big_offset = 20,
    colors = {
    	green = { r = 119, g = 221, b = 119 },
    	yellow = { r = 253, g = 253, b = 150 },
    	red = { r = 255, g = 105, b = 97 },
    	blue = { r = 174, g = 198, b = 237 },
    },
    circle_values = {
    	margin = 10,
    	radius = 8,
    	angle1 = 0,
    	angle2 = 2 * math.pi,
    }
}

return utils
