return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            highlight = {enable = true},
            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = "v",
                    node_decremental = "V",
                },
            },
        },

        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    }
}
