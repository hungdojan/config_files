local function telescopeSetup()
    require("telescope").setup({
        pickers = {
            live_grep = { theme = "ivy" },
            find_files = { theme = "ivy" },
            git_status = { theme = "ivy" },
            lsp_references = { theme = "ivy" },
        }
    })
    local _telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>tf", _telescope_builtin.find_files, { desc = "Find File" })
    vim.keymap.set("n", "<leader>tg", _telescope_builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>tb", _telescope_builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>tr", _telescope_builtin.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>th", _telescope_builtin.git_status, { desc = "Git Status" })
end

local function whichKeySetup()
    local whichKey = require("which-key")
    whichKey.setup({
        preset = "helix",
        spec = {
            { "<leader>t", group = "Telescope",     mode = "n" },
            { "<leader>m", group = "Make commands", mode = "n" },
            { "<leader>s", group = "Spelling",      mode = "n" },
            { "<leader>g", group = "Git Signs",     mode = "n" },
            { "<leader>w", group = "Debugger",      mode = "n" },
        },
    })
end

local function nvimTreeSetup()
    require("nvim-tree").setup({
        view = {
            signcolumn = "no",
        },
    })
    vim.keymap.set("n", "<F8>", ":NvimTreeFocus<CR>", { desc = "Open nvim-tree panel" })
    vim.keymap.set("n", "<F9>", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree panel" })
end

local function gitSignsSetup()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
        current_line_blame = true
    })
    vim.keymap.set("n", "<leader>gb", gitsigns.blame, { desc = "Git Blame" })
    vim.keymap.set("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame Inline" })
    vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })
    vim.keymap.set("n", "<leader>gH", gitsigns.preview_hunk_inline, { desc = "Git Changes Inline" })
    vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage/Unstage Hunk" })
    vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
end

return function()
    require("neoscroll").setup()
    require("nvim-autopairs").setup({
        map_cr = true,
        enable_check_bracket_line = false,
    })
    require("lualine").setup()
    require("nvim-treesitter.configs").setup({
        highlight = {
            enable = true,
        },
    })
    require("fidget").setup()
    telescopeSetup()
    nvimTreeSetup()
    whichKeySetup()
    gitSignsSetup()

    -- other
    vim.notify = require("notify")
end
