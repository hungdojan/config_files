-- source: https://github.com/arnvald/viml-to-lua
HOME = os.getenv('HOME')

-- basic settings
vim.opt.encoding = "utf-8"
vim.opt.backspace = "indent,eol,start"
vim.opt.completeopt = 'menuone,noselect,noinsert'
vim.opt.history = 750
vim.opt.termguicolors = true
vim.opt.startofline = true
vim.opt.hlsearch = false 

-- display
vim.opt.showmatch = false -- show matching brackets
vim.opt.scrolloff = 3
vim.opt.synmaxcol = 200
vim.opt.laststatus = 2

vim.opt.list = false
vim.opt.foldenable = false
vim.opt.foldlevel = 4 -- limit folding to 4 levels
vim.opt.foldmethod = 'syntax' -- use language syntax to generate folds
vim.opt.wrap = true --do not wrap lines even if very long
vim.opt.eol = false -- show if there's no eol char
vim.opt.showbreak= '↪' -- character to show when line is broken


-- sidebar
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.showcmd = true

-- search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.matchtime = 2

-- whitespaces
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.formatoptions = "tcrqn1"

-- mapping waiting time
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.timeoutlen = 5000
vim.opt.ttimeoutlen = 100
vim.opt.updatetime = 1000

-- other
vim.opt.mouse = 'nvi'
vim.opt.background = 'dark'
vim.opt.belloff = all
vim.opt.backup = true
vim.opt.directory = HOME .. '/.vim/tmp/swap'
vim.opt.backupdir = HOME .. '/.vim/tmp/backup'
vim.opt.wildmenu = true
vim.opt.cursorline = true
vim.g.load_doxygen_syntax=1

vim.cmd([[
    set t_Co=256
    set cc=80
    set spellsuggest=best,9
]])

-- themes 
theme = 'catppuccin'
-- theme = 'onehalf' .. vim.o.background
-- theme = 'gruvbox'

vim.cmd.colorscheme(theme)

if theme == 'catppuccin' then
    vim.g.airline_theme = 'catppuccin'
end

-- python formatting
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    command = 'set equalprg=black\\ -q\\ -'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    command = 'set formatprg=black\\ -q\\ 2>/dev/null\\ --stdin-filename\\ \\%\\ -'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'haskell',
    command = 'set equalprg=hindent\\ --indent-size\\ 4\\ \\%'
})

-- vim.g.airline_powerline_fonts = 0
-- TODO: update airline symbols
