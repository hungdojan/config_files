return function(use)
    -- global plugins
    use("neovim/nvim-lspconfig")

    use("stevearc/conform.nvim")
    use("numToStr/Comment.nvim")
    use({
        "folke/todo-comments.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    -- autocompletion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip", -- snippet engine
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
    }) -- completion plugin
    use("ray-x/lsp_signature.nvim")
end
