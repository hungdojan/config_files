return function()
    require("gitsigns").setup()
    require("neoscroll").setup()
    require("nvim-autopairs").setup({
        map_cr = true,
        enable_check_bracket_line = false,
    })
    require("lualine").setup()
    require("nvim-tree").setup({
        view = {
            signcolumn = "no",
        },
    })
    require("nvim-treesitter.configs").setup({
        highlight = {
            enable = true,
        },
    })
    require("fidget").setup()
    require("telescope").setup({})

    -- keymapping
    vim.keymap.set("n", "<F8>", ":NvimTreeFocus<CR>", { desc = "Open nvim-tree panel" })
    vim.keymap.set("n", "<F9>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree panel" })

    local whichKey = require("which-key")
    whichKey.setup({
        preset = "helix",
        spec = {
            { "<leader>t", group = "Telescope", mode = "n" },
            { "<leader>m", group = "Make commands", mode = "n" },
            { "<leader>s", group = "Spelling", mode = "n" },
        },
    })

    local _telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>tf", _telescope_builtin.find_files, { desc = "Find File" })
    vim.keymap.set("n", "<leader>tg", _telescope_builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>tb", _telescope_builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>tr", _telescope_builtin.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>th", _telescope_builtin.git_status, { desc = "Git Status" })

    -- other
    vim.notify = require("notify")
end
