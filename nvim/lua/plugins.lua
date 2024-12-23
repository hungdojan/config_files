return require("packer").startup(function()
	-- global plugins
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")

	-- autocompletion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-cmdline")

	-- notification and progress bars
	use("j-hui/fidget.nvim")
	use("rcarriga/nvim-notify")

	-- lsp signature dialog window
	use("ray-x/lsp_signature.nvim")

	-- mason
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})

	-- null-ls
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine

	-- colorscheme
	use("dracula/vim")
	-- use 'ellisonleao/gruvbox.nvim'
	use("morhetz/gruvbox")

	-- neoscroll
	use("karb94/neoscroll.nvim")

	-- airline
	-- use 'vim-airline/vim-airline' -- powerline
	-- use 'vim-airline/vim-airline-themes'

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- nvim-tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	use({ "sonph/onehalf", rtp = "vim/" })

	-- GitGutter
	use("airblade/vim-gitgutter")

	-- vimtex
	-- use 'lervag/vimtex'

	-- editorconfig
	-- use 'gpanders/editorconfig.nvim'

	use({ "catppuccin/nvim", as = "catppuccin" })

	use("windwp/nvim-autopairs")

	use("nvim-treesitter/nvim-treesitter")

	use("Vimjas/vim-python-pep8-indent")

	use("numToStr/Comment.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
end)
