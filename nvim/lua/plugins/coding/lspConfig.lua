local activeLsp = {
    "ccls",
    "pyright",
    "bashls",
    -- "lua_ls", -- requires `lua-language-server`
    -- "ts_ls",  -- requires `typescript-language-server`
    "gopls",
    "yamlls",
    -- "texlab",
}

local function newLspConfig()
    vim.lsp.enable(activeLsp)
    vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    -- configs
    for _, lspName in ipairs(activeLsp) do
        local cfg = require("plugins.coding.lsp." .. lspName)
        vim.lsp.config(lspName, cfg)
    end
    vim.diagnostic.config()
end

local function oldLspConfig()
    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end
    end
    -------------------------------------------------
    -- LSP setups
    local lspconfig = require("lspconfig")
    for _, lspName in ipairs(activeLsp) do
        local cfg = require("plugins.coding.lsp." .. lspName)
        cfg[on_attach] = on_attach
        cfg[capabilities] = capabilities
        lspconfig[lspName].setup = cfg
    end
end

return function()
    if vim.fn.has("nvim-0.11") then
        newLspConfig()
    else
        oldLspConfig()
    end
    vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        float = {
            border = "rounded",
            scope = "cursor",
        },
    })
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            vim.diagnostic.open_float(nil, { focus = false })
        end,
    })
end
