return require('packer').startup(function()
    -- global plugins
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'

    -- colorscheme
    use 'dracula/vim'
    -- use "ellisonleao/gruvbox.nvim"
    use 'morhetz/gruvbox'

    -- neoscroll
    use 'karb94/neoscroll.nvim'

    -- airline
    use 'vim-airline/vim-airline' -- powerline
    use 'vim-airline/vim-airline-themes'
    
    -- nvim-tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'williamboman/mason.nvim'

    -- ccls lsp
    -- use 'nvim-lua/completion-nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- use 'onsails/lspkind.nvim'
    use { 'sonph/onehalf', rtp = 'vim/' }

    -- GitGutter
    use 'airblade/vim-gitgutter'

    -- vimtex
    use 'lervag/vimtex'

    -- editorconfig
    use 'gpanders/editorconfig.nvim'

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use 'windwp/nvim-autopairs'

    use 'nvim-treesitter/nvim-treesitter'
end)
