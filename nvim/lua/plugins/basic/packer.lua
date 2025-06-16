return function(use)
    use("folke/which-key.nvim")
    use("rcarriga/nvim-notify")
    use({
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons", opts = true },
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opts = true },
    })
    use("lewis6991/gitsigns.nvim")
    use("karb94/neoscroll.nvim")
    use("windwp/nvim-autopairs")
    use("nvim-treesitter/nvim-treesitter")
    use("j-hui/fidget.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
end
