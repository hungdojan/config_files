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

-- requires `ccls`
lspconfig.ccls.setup {
    init_options = {
        cache = {
            -- directory = ".ccls-cache";
            directory = "/tmp/ccls",
        },
        clang = {
            extraArgs = { "-Wunused", "-Wunused-parameter" },
            excludeArgs = {},
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
    single_file_support = true
}

-- requires `pyright`
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- requires `haskell-language-server-wrapper`
--          `stylish-haskell`
lspconfig.hls.setup {
    filetype = { 'haskell', 'lhaskell', 'cabal' },
    capabilities = capabilities,
    on_attach = on_attach,
}

-- requires `rust-analyzer`
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
}

-- requires `bash-language-server`
--          `shellcheck`
lspconfig.bashls.setup {
    on_attach = on_attach,
}

-- requires `lua-language-server`
lspconfig.lua_ls.setup {
    on_attach = on_attach,
}

-- requires `typescript-language-server`
lspconfig.tsserver.setup {
    on_attach = on_attach,
}
