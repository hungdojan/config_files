return function()
    require("gitsigns").setup()
    require("neoscroll").setup()
    require("nvim-autopairs").setup({
        map_cr = true,
        enable_check_bracket_line = false,
    })
    require("lualine").setup()
    require("nvim-tree").setup()
    require("nvim-treesitter.configs").setup({
        highlight = {
            enable = true
        }
    })
    require("fidget").setup()
    require("telescope").setup()

    -- keymapping
    vim.keymap.set("n", "<F8>", ":NvimTreeFocus<CR>", {})
    vim.keymap.set("n", "<F9>", ":NvimTreeToggle<CR>", {})

    local _telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "tf", _telescope_builtin.find_files, {})
    vim.keymap.set("n", "tg", _telescope_builtin.live_grep, {})
    vim.keymap.set("n", "tb", _telescope_builtin.buffers, {})
    vim.keymap.set("n", "th", _telescope_builtin.help_tags, {})

    -- other
    vim.notify = require("notify")
end
