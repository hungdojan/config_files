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

    vim.keymap.set({ "v", "n" }, "<C-\\>", function()
        require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 2000,
        })
    end, {
        silent = true,
    })
end
return function()
    require("todo-comments").setup()
    require("Comment").setup({
        toggler = {
            line = "g/",
            block = "gb",
        },
    })
    require("plugins.lsp.lspConfig")()
    require("plugins.lsp.nvimCmp")()
    require("lsp_signature").setup()
    conformSetup()
end
