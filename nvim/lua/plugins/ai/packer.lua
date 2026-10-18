return function()
    -- vim.pack does not auto-install `depends` entries, so they are listed explicitly.
    vim.pack.add({
        { src = "https://github.com/folke/snacks.nvim" },           -- dep: claudecode
        { src = "https://github.com/coder/claudecode.nvim",
          depends = { { src = "https://github.com/folke/snacks.nvim" } } },
    })
end
