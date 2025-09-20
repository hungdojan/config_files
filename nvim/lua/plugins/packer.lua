---Initialize the plugin manager Packer
---@param pluginOpts PluginOpts  A table with plugin option flags.
return function(pluginOpts)
	require("packer").startup(function(use)
		use("wbthomason/packer.nvim")
		if pluginOpts.basic then
			require("plugins.basic").packer(use)
		end
		if pluginOpts.colorscheme then
			require("plugins.colorscheme").packer(use)
		end
		if pluginOpts.coding then
			require("plugins.coding").packer(use)
		end
		if pluginOpts.extra then
			require("plugins.extra").packer(use)
		end
	end)
end
