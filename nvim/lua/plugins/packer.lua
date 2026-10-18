---Initialize plugins via vim.pack (built-in, Neovim 0.11+)
---@param pluginOpts PluginOpts  A table with plugin option flags.
return function(pluginOpts)
	if pluginOpts.basic then
		require("plugins.basic").pack()
	end
	if pluginOpts.colorscheme then
		require("plugins.colorscheme").pack()
	end
	if pluginOpts.coding then
		require("plugins.coding").pack()
	end
	if pluginOpts.extra then
		require("plugins.extra").pack()
	end
	if pluginOpts.ai then
		require("plugins.ai").pack()
	end
end
