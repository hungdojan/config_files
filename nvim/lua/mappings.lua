function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command,
    {
        noremap = true,
        silent = true,
    })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

function imap_expr(shortcut, command)
    vim.api.nvim_set_keymap('i', shortcut, command,
    {
        silent = true,
        expr = true
    })
end

-- toggle between light mode and dark mode
function colorscheme_toggle()
    if (vim.g.colors_name == "onehalfdark") then
        vim.cmd([[
            colorscheme onehalflight
            AirlineTheme onehalflight
        ]])
    else
        vim.cmd([[
            colorscheme onehalfdark
            AirlineTheme onehalfdark
        ]])
    end
end

function custom_mappings()
    vim.cmd('split|view $HOME/.config/nvim/resources/mappings.txt')
end

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
vim.cmd([[
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

--[[ 
   Use tab for trigger completion with characters ahead and navigate.
   NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
   other plugin before putting this into your config.
  ]]
imap_expr('<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"')
imap_expr('<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"')
imap_expr('<C-space>', 'coc#refresh()')

nmap('<F8>', ':NvimTreeFocus<CR>')
nmap('<F9>', ':NvimTreeToggle<CR>')

-- compilation with make
nmap('<F29>', ':w<CR>:make<CR>')    -- <C-F5>
nmap('<F5>',  ':w<CR>:make run<CR>')
nmap('<F47>', ':cp<CR>')            -- <C-S-F11>
nmap('<F48>', ':cn<CR>')            -- <C-S-F12>
nmap('<F46>', ':cwindow<CR>')       -- <C-S-F10>
nmap('<F12>', ':set spell! spelllang=en<CR>')    -- <F12>
nmap('<F36>', ':set spell! spelllang=cs<CR>')    -- <C-F12>
nmap('<F37>', ':lua colorscheme_toggle()<CR>')   -- <C-S-F1>
nmap('<F25>', ':lua custom_mappings()<CR>')      -- <C-F1>

-- edit functions
nmap('Y', 'yy')
imap('<C-h>', '<C-W>')
imap('<C-Del>', '<C-o>dw')
