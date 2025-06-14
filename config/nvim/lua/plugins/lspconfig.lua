return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require('lspconfig').clangd.setup({})
        end,
    }
}
