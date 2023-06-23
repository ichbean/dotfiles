return {
    {
        "shaunsingh/nord.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
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

    {"lukas-reineke/indent-blankline.nvim"},

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            require('lsp-zero.settings').preset({})
        end
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            require('lsp-zero.cmp').extend()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                preselect = 'item',
                completion = {
                    completeopt = 'menu, menuone, noinsert'
                },
                mapping = {
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<CR>'] = cmp.mapping.confirm({select = true})
                }
            })
        end
    },

    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {'williamboman/mason-lspconfig.nvim'},
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        },
        config = function()

            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)

            lsp.ensure_installed({
                'bashls',
                'lua_ls',
                'pyright',
                'rust_analyzer'
            })

            require('lspconfig').rust_analyzer.setup({})

            lsp.setup()
        end
    }
}
