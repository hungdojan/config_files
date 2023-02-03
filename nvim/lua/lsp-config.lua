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
    filetype = { 'py' }
}
