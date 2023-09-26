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
