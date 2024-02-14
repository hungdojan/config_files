-- LSP setups
local lspconfig = require('lspconfig')

lspconfig.ccls.setup {
    init_options = {
        cache = {
            directory = ".ccls-cache";
        };
    },
    -- on_attach = require'completion'.on_attach,
    filetype = { 'cc', 'cpp' }
}

lspconfig.pyright.setup {
    -- on_attach = require'completion'.on_attach,
    filetype = { 'py' },
}

lspconfig.hls.setup {
    filetype = {'haskell', 'lhaskell', 'cabal'},
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    root_dir = lspconfig.util.root_pattern("hie.yaml", "stack.yaml", "cabal.project", "*.cabal", "package.yaml"),
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "ormolu"
        }
    },
    single_file_support = true
}

-------------------------------------------------
local nvim_tree_setup = require "nvim_tree_setup"

require('mason').setup()
require('neoscroll').setup()

require('nvim-autopairs').setup({
    map_cr = false
})

require('nvim-tree').setup({
    on_attach = nvim_tree_setup.on_attach
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    }
})
