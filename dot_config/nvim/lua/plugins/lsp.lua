return {
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
            {'hrsh7th/cmp-path'}
        },
        config = function()
            require('lsp-zero.cmp').extend()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                sources = {
                    {name = 'path'},
                    {name = 'nvim_lsp'},
                    {name = 'luasnip', keyword_length = 2}
                },
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
                'pylsp',
                'rust_analyzer'
            })

            lsp.setup()
        end
    },
}
