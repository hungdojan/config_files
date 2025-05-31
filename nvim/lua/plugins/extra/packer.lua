return function(use)
	use("Vimjas/vim-python-pep8-indent")
	use("folke/which-key.nvim")
	use({
		"kawre/leetcode.nvim",
		run = ":TSUpdate html", -- if you have `nvim-treesitter` installed
		requires = {
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"m4xshen/hardtime.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	})
	use("OXY2DEV/markview.nvim")
	use({
		"nvzone/typr",
		requires = "nvzone/volt",
	})
end
