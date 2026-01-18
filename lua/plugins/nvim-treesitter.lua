return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = false,
            indent = { enable = true },
            incremental_selection = { enable = true },
            textobjects = { enable = true },
            highlight = { enable = true },
            -- Sync parser installation
            sync_install = true,
        })
    end
}
