return function()
    -- vim.pack does not auto-install `depends` entries, so they are listed explicitly.
    vim.pack.add({
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/stevearc/conform.nvim" },
        { src = "https://github.com/numToStr/Comment.nvim" },
        { src = "https://github.com/folke/todo-comments.nvim",
          depends = { { src = "https://github.com/nvim-lua/plenary.nvim" } } },
        -- nvim-cmp deps
        { src = "https://github.com/hrsh7th/cmp-buffer" },
        { src = "https://github.com/hrsh7th/cmp-path" },
        { src = "https://github.com/hrsh7th/cmp-cmdline" },
        { src = "https://github.com/L3MON4D3/LuaSnip" },
        { src = "https://github.com/rafamadriz/friendly-snippets" },
        { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
        { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
        { src = "https://github.com/hrsh7th/nvim-cmp", depends = {
            { src = "https://github.com/hrsh7th/cmp-buffer" },
            { src = "https://github.com/hrsh7th/cmp-path" },
            { src = "https://github.com/hrsh7th/cmp-cmdline" },
            { src = "https://github.com/L3MON4D3/LuaSnip" },
            { src = "https://github.com/rafamadriz/friendly-snippets" },
            { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
            { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
        } },
        { src = "https://github.com/ray-x/lsp_signature.nvim" },
        -- nvim-dap deps
        { src = "https://github.com/nvim-neotest/nvim-nio" },
        { src = "https://github.com/rcarriga/nvim-dap-ui",
          depends = { { src = "https://github.com/nvim-neotest/nvim-nio" } } },
        { src = "https://github.com/mfussenegger/nvim-dap", depends = {
            { src = "https://github.com/nvim-neotest/nvim-nio" },
            { src = "https://github.com/rcarriga/nvim-dap-ui",
              depends = { { src = "https://github.com/nvim-neotest/nvim-nio" } } },
        } },
    })
end
