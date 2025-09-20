return function()
    require("ibl").setup({
        indent = {
            highlight = { "IblWhitespace" },
            char = "│",
        },
        scope = { enabled = false },
    })
    require("plugins.extra.ufoSetup")

    require("leetcode").setup({
        lang = "golang",
    })
    require("hardtime").setup({
        disable_mouse = false,
        max_count = 20,
        disabled_keys = {
            ["<Up>"] = { "n", "x" },
            ["<Left>"] = { "n", "x" },
            ["<Right>"] = { "n", "x" },
            ["<Down>"] = { "n", "x" },
        },
    })

    vim.keymap.set("n", "<leader>M", ":Markview toggle<cr>", { desc = "Toggle Markdown view" })
end
