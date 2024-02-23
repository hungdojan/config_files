-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
    single_file_support = true
}

lspconfig.pyright.setup {
    capabilities = capabilities
}

lspconfig.hls.setup {
    filetype = {'haskell', 'lhaskell', 'cabal'},
    capabilities = capabilities
}

lspconfig.rust_analyzer.setup {
}

lspconfig.bashls.setup{
}
