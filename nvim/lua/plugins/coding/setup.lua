local function conformSetup()
    require("conform").setup({
        formatters_by_ft = {
            json = { "jq" },
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { "prettier" },
            typescript = { "prettier" },
        },
        formatters = {
            isort = {
                profile = "black",
            },
        },
    })

    vim.keymap.set({ "v", "n" }, "<leader>f", function()
        require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 2000,
        })
    end, {
        silent = true,
        desc = "Format document"
    })
end
return function()
    require("todo-comments").setup()
    require("Comment").setup({
        toggler = {
            line = "g/",
        },
    })
    require("plugins.coding.lspConfig")()
    require("plugins.coding.nvimCmp")()
    require("plugins.coding.dapConfig")()
    require("lsp_signature").setup()
    conformSetup()
end
