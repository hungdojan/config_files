-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end
end
-------------------------------------------------
-- LSP setups
local lspconfig = require('lspconfig')

-- requires `ccls`
lspconfig.ccls.setup {
    init_options = {
        cache = {
            -- directory = ".ccls-cache";
            directory = "/tmp/ccls",
        },
        clang = {
            extraArgs = { "-Wunused", "-Wunused-parameter", "-Wall" },
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
    settings = {
        Lua = {
            runtime = {
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand '~/.luarocks/share/lua/5.4/?.lua',
                    vim.fn.expand '~/.luarocks/share/lua/5.4/?/init.lua',
                    '/usr/share/5.4/?.lua',
                    '/usr/share/lua/5.4/?/init.lua'
                }
            },
            workspace = {
                library = {
                    vim.fn.expand '~/.luarocks/share/lua/5.4',
                    '/usr/share/lua/5.4'
                }
            },
            diagnostics = {
                globals = { 'vim' }
            },
            hint = { enable = true }
        }
    }
}

-- requires `typescript-language-server`
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    javascript = {
        inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        }
    },
    typescript = {
        inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = 'all',
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
        }
    }
}
