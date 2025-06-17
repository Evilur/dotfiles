return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'onsails/lspkind.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-e>'] = cmp.mapping.abort(),
            }),
            window = {
                completion = {
                    border = 'single',
                    winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel',
                    scrollbar = false,
                },
                documentation = {
                    border = 'signle',
                    winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel',
                }
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
            }),
            formatting = {
                format = require('lspkind').cmp_format({
                    mode = 'symbol',
                    ellipsis_char = '...',
                    show_labelDetails = true,
                })
            }
        })
    end
}
