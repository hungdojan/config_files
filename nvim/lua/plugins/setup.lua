---List of setup functions
---@param pluginOpts PluginOpts  A table with plugin option flags.
return function(pluginOpts)
    if pluginOpts.basic then
        require("plugins.basic").setup()
    end
    if pluginOpts.colorscheme then
        require("plugins.colorscheme").setup()
    end
    if pluginOpts.lsp then
        require("plugins.lsp").setup()
    end
    if pluginOpts.extra then
        require("plugins.extra").setup()
    end
end
