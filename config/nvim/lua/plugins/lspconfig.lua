return {
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require('lspconfig').clangd.setup({
                --cmd = { "clangd", "--compile-commands-dir=build" },
            })
        end,
    }
}
