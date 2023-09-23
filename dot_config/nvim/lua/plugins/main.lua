return {
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_italic = false
            vim.g.nord_bold = false
            vim.cmd([[colorscheme nord]])
            local links = {
                ['@lsp.type.namespace'] = '@namespace',
                ['@lsp.type.type'] = '@type',
                ['@lsp.type.class'] = '@type',
                ['@lsp.type.enum'] = '@type',
                ['@lsp.type.interface'] = '@type',
                ['@lsp.type.struct'] = '@structure',
                ['@lsp.type.parameter'] = '@parameter',
                ['@lsp.type.variable'] = '@variable',
                ['@lsp.type.property'] = '@property',
                ['@lsp.type.enumMember'] = '@constant',
                ['@lsp.type.function'] = '@function',
                ['@lsp.type.method'] = '@method',
                ['@lsp.type.macro'] = '@macro',
                ['@lsp.type.decorator'] = '@function',
            }
            for newgroup, oldgroup in pairs(links) do
                vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
            end
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

    {"lukas-reineke/indent-blankline.nvim"},
}
