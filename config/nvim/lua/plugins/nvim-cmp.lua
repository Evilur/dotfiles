return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        'onsails/lspkind.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'Jezda1337/nvim-html-css'
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
            }),
            window = {
                completion = {
                    border = 'single',
                    scrollbar = false,
                    winhighlight = 'Normal:Pmenu,FloatBorder:PmenuBorder,' ..
                                   'CursorLine:PmenuSel,Search:None'
                },
                documentation = { border = 'single' }
            },
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
                { name = 'nvim-html-css' }
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
