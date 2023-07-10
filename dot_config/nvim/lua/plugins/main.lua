return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_italic = false
            vim.g.nord_bold = false
            vim.cmd([[colorscheme nord]])
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "nord",
                icons_enabled = false,
                component_separators = "|",
                section_separators = ""
            }
        }
    },

    {
        "echasnovski/mini.align",
        version = "false",
        opts = {
            start = 'ga'
        }
    },

    {"lukas-reineke/indent-blankline.nvim"},
}
