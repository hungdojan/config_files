--- Define a table type for plugin options
---@class PluginOpts
---@field basic boolean        Enable basic plugins
---@field coding boolean       Enable LSP support
---@field extra boolean        Enable extra plugins
---@field colorscheme boolean  Enable colorscheme
pluginOpts = {
    basic = true,
    coding = true,
    extra = true,
    colorscheme = true
}

require("plugins.packer")(pluginOpts)
require("plugins.setup")(pluginOpts)
