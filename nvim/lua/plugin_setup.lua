require("mason").setup()
require("mason-lspconfig").setup()

-- import setups
require("setups.nvim_cmp_setup")
require("setups.lsp_setup")
require("setups.fidget_setup")
require("setups.lsp_signature_setup")
require("setups.null_ls_setup")

-----------------------------------
-- local setups

local nvim_tree_setup = require("setups.nvim_tree_setup")
require("nvim-tree").setup({
	on_attach = nvim_tree_setup.on_attach,
})

require("neoscroll").setup()

require("nvim-autopairs").setup({
	map_cr = true,
	enable_check_bracket_line = false,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

require("lualine").setup({})

require("Comment").setup({
	toggler = {
		line = "g/",
		block = "gb",
	},
})
