return require('packer').startup(function()
    -- global plugins
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'

    -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp' -- completion plugin
    use 'hrsh7th/cmp-buffer' -- source for text in buffer
    use 'hrsh7th/cmp-path' -- source for file system paths
    use 'hrsh7th/cmp-cmdline'
    use 'j-hui/fidget.nvim'

    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine

    -- colorscheme
    use 'dracula/vim'
    -- use 'ellisonleao/gruvbox.nvim'
    use 'morhetz/gruvbox'

    -- neoscroll
    use 'karb94/neoscroll.nvim'

    -- airline
    use 'vim-airline/vim-airline' -- powerline
    use 'vim-airline/vim-airline-themes'

    -- nvim-tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use { 'sonph/onehalf', rtp = 'vim/' }

    -- GitGutter
    use 'airblade/vim-gitgutter'

    -- vimtex
    -- use 'lervag/vimtex'

    -- editorconfig
    use 'gpanders/editorconfig.nvim'

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use 'windwp/nvim-autopairs'

    use 'nvim-treesitter/nvim-treesitter'
end)
