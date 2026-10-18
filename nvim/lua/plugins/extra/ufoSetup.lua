local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

-- global handler

require('ufo').setup({
    fold_virt_text_handler = handler,
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
        default = {'imports', 'comment'},
        json = {'array'},
        c = {'comment', 'region'}
    },
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>',
            jumpTop = '[',
            jumpBot = ']'
        }
    },
    provider_selector = function(_, filetype)
        if filetype == 'git' then
            return ''
        end
        return {'treesitter', 'indent'}
    end
})

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end)

-- <leader>z fold shortcuts
local ufo = require('ufo')
local function fmap(lhs, rhs, desc)
    vim.keymap.set('n', '<leader>z' .. lhs, rhs, { desc = desc })
end
fmap('a', 'za', 'Toggle fold')
fmap('A', 'zA', 'Toggle fold recursively')
fmap('o', 'zo', 'Open fold')
fmap('O', 'zO', 'Open fold recursively')
fmap('c', 'zc', 'Close fold')
fmap('C', 'zC', 'Close fold recursively')
fmap('v', 'zv', 'Reveal cursor line')
fmap('R', ufo.openAllFolds, 'Open all folds')
fmap('M', ufo.closeAllFolds, 'Close all folds')
fmap('r', ufo.openFoldsExceptKinds, 'Open folds except kinds')
fmap('m', ufo.closeFoldsWith, 'Close folds with level')
fmap('p', ufo.peekFoldedLinesUnderCursor, 'Peek folded lines')
fmap('z', 'zi', 'Toggle folding on/off')
fmap('j', 'zj', 'Next fold start')
fmap('k', 'zk', 'Previous fold end')

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.opt.fillchars:append({ foldopen = '▾', foldclose = '▸', fold = ' ', foldsep = ' ' })
vim.o.statuscolumn = '%s%=%l%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }%*'
