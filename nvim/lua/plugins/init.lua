--- Define a table type for plugin options
---@class PluginOpts
---@field basic bool        Enable basic plugins
---@field lsp   bool        Enable LSP support
---@field extra bool        Enable extra plugins
---@field colorscheme bool  Enable colorscheme
pluginOpts = {
    basic = true,
    lsp = true,
    extra = true,
    colorscheme = true
}

require("plugins.packer")(pluginOpts)
require("plugins.setup")(pluginOpts)
