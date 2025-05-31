local themes = {
	kanso = "kanso",
	catppuccin = "catppuccin",
	onehalf = "onehalf" .. vim.o.background,
	gruvbox = "gruvbox",
}
Theme = themes.catppuccin

local function themeToggle()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"
	vim.notify("test")

	if Theme:find("onehalf", 1, true) == 1 then
		vim.cmd.colorscheme("onehalf" .. vim.o.background)
		vim.g.airline_theme = "onehalf" .. vim.o.background
	end
end

return function()
	vim.cmd.colorscheme(Theme)

	-- keymapping
	vim.keymap.set("n", "<C-S-F2>", themeToggle, {}) -- <C-S-F2>
	vim.keymap.set("n", "<F38>", themeToggle, {}) -- <C-S-F2>
end
