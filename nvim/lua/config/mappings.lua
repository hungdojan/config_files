vim.keymap.set("n", "<F8>", ":NvimTreeFocus<CR>", {})
vim.keymap.set("n", "<F9>", ":NvimTreeToggle<CR>", {})

-- compilation with make
vim.keymap.set("n", "<F29>", ":w<CR>:!make -C.. --quiet<CR>", {}) -- <C-F5>
vim.keymap.set("n", "<C-F5>", ":w<CR>:!make -C.. --quiet<CR>", {}) -- <C-F5>
vim.keymap.set("n", "<F5>", ":w<CR>:make run -C.. --quiet<CR>", {})
vim.keymap.set("n", "<C-F6>", ":w<CR>:make --quiet<CR>", {}) -- <C-F6>
vim.keymap.set("n", "<F30>", ":w<CR>:make --quiet<CR>", {}) -- <C-F6>
vim.keymap.set("n", "<F6>", ":w<CR>:make run --quiet<CR>", {})
vim.keymap.set("n", "<C-S-F10>", ":cwindow<CR>", {}) -- <C-S-F10>
vim.keymap.set("n", "<F46>", ":cwindow<CR>", {}) -- <C-S-F10>

vim.keymap.set("n", "<F12>", ":set spell! spelllang=en<CR>", {}) -- <F12>
vim.keymap.set("n", "<C-F12>", ":set spell! spelllang=cs<CR>", {}) -- <C-F12>
vim.keymap.set("n", "<F36>", ":set spell! spelllang=cs<CR>", {}) -- <C-F12>

-- vim.keymap.set("n", "<C-F2>", function()
-- 	vim.cmd("split|view $HOME/.config/nvim/resources/mappings.txt")
-- end, {}) -- <C-F2>
vim.keymap.set("n", "<C-F11>", "<C-w>|<C-w>_", {}) -- <C-F11>
vim.keymap.set("n", "<F35>", "<C-w>|<C-w>_", {}) -- <C-F11>
vim.keymap.set("n", "<C-S-F11>", "<C-w>=", {}) -- <C-S-F11>
vim.keymap.set("n", "<F47>", "<C-w>=", {}) -- <C-S-F11>

-- quick copy and delete
vim.keymap.set("n", "Y", "yy", {})
vim.keymap.set("i", "<C-h>", "<C-W>", {})
vim.keymap.set("i", "<C-Del>", "<C-o>dw", {})
