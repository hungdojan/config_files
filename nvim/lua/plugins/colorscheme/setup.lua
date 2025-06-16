local themes = {
	kanso = "kanso",
	catppuccin = "catppuccin",
	onehalf = "onehalf" .. vim.o.background,
	gruvbox = "gruvbox",
}
Theme = themes.catppuccin

local function themeToggle()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"

	if Theme:find("onehalf", 1, true) == 1 then
		vim.cmd.colorscheme("onehalf" .. vim.o.background)
		vim.g.airline_theme = "onehalf" .. vim.o.background
	end
end

return function()
	vim.cmd.colorscheme(Theme)

	-- keymapping
	vim.keymap.set("n", "<leader>T", themeToggle, {desc = "Toggle between light and dark mode."}) -- <C-S-F2>
end
