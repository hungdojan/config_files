-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.buf.inlay_hint(bufnr, true)
    end
end
-------------------------------------------------
-- LSP setups
local lspconfig = require('lspconfig')
-- lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())

lspconfig.ccls.setup {
    init_options = {
        cache = {
            -- directory = ".ccls-cache";
            directory = "/tmp/ccls";
        };
        clang = {
            extraArgs = {"-Wunused", "-Wunused-parameter"};
            excludeArgs = {};
        };
    },
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.hls.setup {
    filetype = {'haskell', 'lhaskell', 'cabal'},
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
}

lspconfig.bashls.setup{
    on_attach = on_attach,
}
