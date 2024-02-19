-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-------------------------------------------------
-- LSP setups
local lspconfig = require('lspconfig')
-- lspconfig.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())

lspconfig.ccls.setup {
    init_options = {
        cache = {
            -- directory = ".ccls-cache";
            directory = "/tmp/ccls";
        };
        clang = {
            extraArgs = {"-Wunused", "-Wunused-parameter"};
        };
    },
    capabilities = capabilities,
    single_file_support = true
}

lspconfig.pyright.setup {
    filetype = { 'py' },
    capabilities = capabilities
}

lspconfig.hls.setup {
    filetype = {'haskell', 'lhaskell', 'cabal'},
    capabilities = capabilities
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
