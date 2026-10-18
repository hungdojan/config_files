return function()
    vim.pack.add({
        { src = "https://github.com/dracula/vim" },
        { src = "https://github.com/morhetz/gruvbox" },
        { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
        { src = "https://github.com/webhooked/kanso.nvim" },
        { src = "https://github.com/sonph/onehalf", rtp = "vim/" },
    })
end
