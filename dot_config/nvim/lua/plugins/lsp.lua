return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/cmp-path'},
            {'kawre/neotab.nvim', opts = {tabkey = ''}},
            {'onsails/lspkind.nvim'}
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_cmp()

            local cmp = require('cmp')
            local neotab = require('neotab')
            local cmp_action = lsp_zero.cmp_action()
            local lspkind = require('lspkind')

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
                formatting = {
                    fields = {'kind', 'abbr', 'menu'},
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 20,
                        ellipsis_char = '…',
                        show_labelDetails = false,
                        before = function (_, vim_item)
                            vim_item.menu = ''
                            return vim_item
                        end
                    })
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            neotab.tabout()
                        end
                    end),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<CR>'] = cmp.mapping.confirm({select = true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4)
                }),

                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })
        end
    },

    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local lua_opts = lsp_zero.nvim_lua_ls()

            require('lspconfig').lua_ls.setup(lua_opts)

            require'lspconfig'.rust_analyzer.setup{
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = true;
                        }
                    }
                }
            }

            require('lspconfig').pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            ruff = {
                                enabled = true
                            }
                        }
                    }
                }
            })
        end
    }
}
