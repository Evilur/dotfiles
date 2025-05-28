require('lazy').setup({
    {
        'dracula/vim',
        lazy = false,
        config = function()
            vim.cmd('colorscheme dracula')
        end
    },
})
