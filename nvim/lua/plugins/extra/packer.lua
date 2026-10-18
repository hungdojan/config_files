return function()
    -- vim.pack does not auto-install `depends` entries, so they are listed explicitly.
    vim.pack.add({
        { src = "https://github.com/Vimjas/vim-python-pep8-indent" },
        -- { src = "https://github.com/kawre/leetcode.nvim",
        --   build = ":TSUpdate html",
        --   depends = {
        --       { src = "https://github.com/nvim-telescope/telescope.nvim" },
        --       { src = "https://github.com/ibhagwan/fzf-lua" },
        --       { src = "https://github.com/nvim-lua/plenary.nvim" },
        --       { src = "https://github.com/MunifTanjim/nui.nvim" },
        --   } },
        { src = "https://github.com/kevinhwang91/promise-async" },  -- dep: nvim-ufo
        { src = "https://github.com/kevinhwang91/nvim-ufo",
          depends = { { src = "https://github.com/kevinhwang91/promise-async" } } },
        { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
        { src = "https://github.com/MunifTanjim/nui.nvim" },        -- dep: hardtime
        { src = "https://github.com/m4xshen/hardtime.nvim",
          depends = { { src = "https://github.com/MunifTanjim/nui.nvim" } } },
        -- { src = "https://github.com/OXY2DEV/markview.nvim" },
    })
end
