local function setupKeys()
    vim.keymap.set("n", "<leader>cc", ":ClaudeCodeFocus<CR>", { desc = "Focus Claude"})
    vim.keymap.set("n", "<leader>co", ":ClaudeCodeOpen<CR>", { desc = "Open Claude"})
    vim.keymap.set("n", "<leader>cm", ":ClaudeCodeClose<CR>", { desc = "Close Claude"})
    vim.keymap.set("n", "<leader>cr", ":ClaudeCode --resume<CR>", { desc = "Resume Claude"})

    vim.keymap.set("v", "<leader>cs", ":ClaudeCodeSend<CR>", { desc = "Send to Claude"})
    vim.keymap.set("v", "<leader>cB", ":ClaudeCodeAdd %<CR>", { desc = "Add current buffer to Claude"})

    vim.keymap.set("n", "<leader>ca", ":ClaudeCodeDiffAccept<CR>", { desc = "Accept Diff"})
    vim.keymap.set("n", "<leader>cd", ":ClaudeCodeDiffAccept<CR>", { desc = "Reject Diff"})
end

return function()
    require("claudecode").setup({
        git_repo_cwd = true,
        terminal = {
            split_side = "right",
            split_width_percentage = 0.3
       },
        diff_opts = {
            open_in_current_tab = false,
            auto_close_on_accept = true
        }
    })
    setupKeys()
end
