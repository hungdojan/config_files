-- import setups
require("setups.nvim_cmp_setup")
require("setups.lsp_setup")
require('setups.fidget_setup')

-----------------------------------
-- local setups

local nvim_tree_setup = require("setups.nvim_tree_setup")
require('nvim-tree').setup({
    on_attach = nvim_tree_setup.on_attach
})

require('neoscroll').setup()

require('nvim-autopairs').setup({
    map_cr = false
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true
    }
})
