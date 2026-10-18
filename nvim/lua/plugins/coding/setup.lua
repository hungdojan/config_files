local function conformSetup()
    require("conform").setup({
        formatters_by_ft = {
            json = { "jq" },
            lua = { "stylua" },
            python = { "ruff_format" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            terraform = { "terraform_fmt" },
        },
        formatters = {
            isort = {
                profile = "black",
            },
        },
        -- format_on_save = {
        --     timeout_ms = 2000,
        --     lsp_fallback = true,
        -- },
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
        opleader = {
            line = "g/",
        },
    })
    require("plugins.coding.lspConfig")()
    require("plugins.coding.nvimCmp")()
    require("plugins.coding.dapConfig")()
    require("lsp_signature").setup()
    conformSetup()
end
