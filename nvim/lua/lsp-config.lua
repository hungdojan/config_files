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
--lspconfig.ltex.setup{
--  on_attach = on_attach,
--  cmd = { "ltex-ls" },
--  filetypes = { "markdown", "text", "latex", "tex" },
--  flags = { debounce_text_changes = 300 },
--  settings = {
--    ltex = {
--      directory = {
--        ["en-US"] = {"GoodUSB", "BadUSB"},
--      };
--    },
--  },
-- }
