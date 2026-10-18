return function()
    -- vim.pack does not auto-install `depends` entries, so they are listed explicitly.
    vim.pack.add({
        { src = "https://github.com/folke/which-key.nvim" },
        { src = "https://github.com/rcarriga/nvim-notify" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dep: nvim-tree, lualine
        { src = "https://github.com/nvim-tree/nvim-tree.lua",
          depends = { { src = "https://github.com/nvim-tree/nvim-web-devicons" } } },
        { src = "https://github.com/nvim-lualine/lualine.nvim",
          depends = { { src = "https://github.com/nvim-tree/nvim-web-devicons" } } },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },
        { src = "https://github.com/karb94/neoscroll.nvim" },
        { src = "https://github.com/windwp/nvim-autopairs" },
        { src = "https://github.com/j-hui/fidget.nvim" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },       -- dep: telescope, todo-comments
        { src = "https://github.com/nvim-telescope/telescope.nvim", version = "master",
          depends = { { src = "https://github.com/nvim-lua/plenary.nvim" } } },
    })
end
