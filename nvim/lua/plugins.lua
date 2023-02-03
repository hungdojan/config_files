return require('packer').startup(function()
    -- global plugins
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'

    -- colorscheme
    use 'dracula/vim'
    use "ellisonleao/gruvbox.nvim"

    -- neoscroll
    use 'karb94/neoscroll.nvim'
    require'neoscroll'.setup()

    -- airline
    use 'vim-airline/vim-airline' -- powerline
    use 'vim-airline/vim-airline-themes'
    
    -- nvim-tree
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    require'nvim-tree'.setup({
        view = { 
            mappings = {
                list = {
                    { key = "<2-LeftMouse>", action = "tabnew" }
                }
            }
        }
    })
    vim.api.nvim_set_keymap(
        "n",
        "<F4>",
        ":NvimTreeFocus<CR>",
        { noremap = true}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<F5>",
        ":NvimTreeToggle<CR>",
        { noremap = true}
    )

    use 'williamboman/mason.nvim'
    require('mason').setup()

    -- ccls lsp
    use 'prabirshrestha/vim-lsp'
    use 'Shougo/deoplete.nvim'
    use 'lighttiger2505/deoplete-vim-lsp'
    -- use 'deoplete-plugins/deoplete-clang'
    use 'nvim-lua/completion-nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }

    -- use 'onsails/lspkind.nvim'
    use { 'sonph/onehalf', rtp = 'vim/' }

    -- GitGutter
    use 'airblade/vim-gitgutter'

    -- vimtex
    use 'lervag/vimtex'

    -- editorconfig
    use 'gpanders/editorconfig.nvim'
end)
