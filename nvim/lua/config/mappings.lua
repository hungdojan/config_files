vim.keymap.set("n", "<F8>", ":NvimTreeFocus<CR>", {})
vim.keymap.set("n", "<F9>", ":NvimTreeToggle<CR>", {})

-- compilation with make
vim.keymap.set("n", "<leader>mm", "<cmd>!make --quiet<cr>", { desc = "`make` in current folder." })
vim.keymap.set("n", "<leader>mM", "<cmd>!make -C.. --quiet<cr>", { desc = "`make` in parent folder." })
vim.keymap.set("n", "<leader>mr", "<cmd>!make run --quiet<cr>", { desc = "`make run` in current folder." })
vim.keymap.set("n", "<leader>mR", "<cmd>!make run -C.. --quiet<cr>", { desc = "`make run` in parent folder." })

-- spelling
vim.keymap.set("n", "<leader>se", ":set spell! spelllang=en<CR>", { desc = "Toggle English spelling" })
vim.keymap.set("n", "<leader>sc", ":set spell! spelllang=cs<CR>", { desc = "Toggle Czech spelling" })

vim.keymap.set("n", "<C-F11>", "<C-w>|<C-w>_", {}) -- <C-F11>
vim.keymap.set("n", "<F35>", "<C-w>|<C-w>_", {}) -- <C-F11>
vim.keymap.set("n", "<C-S-F11>", "<C-w>=", {}) -- <C-S-F11>
vim.keymap.set("n", "<F47>", "<C-w>=", {}) -- <C-S-F11>

-- quick copy and delete
vim.keymap.set("n", "Y", "yy", {})
vim.keymap.set("i", "<C-h>", "<C-W>", {})
vim.keymap.set("i", "<C-Del>", "<C-o>dw", {})
