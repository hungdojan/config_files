vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"haskell",
		"javascript",
		"typescript",
		"javascriptreact",
		"cpp",
	},
	command = "set sw=2 ts=2",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex", "text", "rst" },
	callback = function()
		vim.opt.textwidth = 90
		vim.opt.shiftwidth = 2
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
	end,
})

-- show diagnostics windows
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		vim.diagnostic.open_float()
	end,
})

-- add custom file types
vim.filetype.add({
	pattern = {
		[".*Containerfile"] = "dockerfile",
	},
})
vim.tbl_islist = vim.islist

-- enable inlay hints
if vim.lsp.inlay_hint then
	vim.lsp.inlay_hint.enable(true, { 0 })
end
