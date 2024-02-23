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
    vim.o.background = vim.o.background == 'dark'
                       and 'light'
                       or 'dark'

    if (theme:find('onehalf', 1, true) == 1) then
        vim.cmd.colorscheme('onehalf' .. vim.o.background)
        vim.g.airline_theme = 'onehalf' .. vim.o.background
    end
end

function custom_mappings()
    vim.cmd('split|view $HOME/.config/nvim/resources/mappings.txt')
end

nmap('<F8>', ':NvimTreeFocus<CR>')
nmap('<F9>', ':NvimTreeToggle<CR>')

-- compilation with make
nmap('<F29>', ':w<CR>:!make -C.. --quiet<CR>')    -- <C-F5>
nmap('<F5>',  ':w<CR>:make run -C.. --quiet<CR>')
nmap('<F30>', ':w<CR>:make --quiet<CR>')          -- <C-F6>
nmap('<F6>',  ':w<CR>:make run --quiet<CR>')
nmap('<F47>', ':cp<CR>')            -- <C-S-F11>
nmap('<F48>', ':cn<CR>')            -- <C-S-F12>
nmap('<F46>', ':cwindow<CR>')       -- <C-S-F10>

nmap('<F12>', ':set spell! spelllang=en<CR>')    -- <F12>
nmap('<F36>', ':set spell! spelllang=cs<CR>')    -- <C-F12>
nmap('<F38>', ':lua colorscheme_toggle()<CR>')   -- <C-S-F2>
nmap('<F26>', ':lua custom_mappings()<CR>')      -- <C-F2>

-- edit functions
nmap('Y', 'yy')
imap('<C-h>', '<C-W>')
imap('<C-Del>', '<C-o>dw')
