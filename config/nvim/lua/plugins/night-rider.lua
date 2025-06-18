return {
    'Evilur/NightRider.nvim',
    lazy = false,
    dev = true,
    dir = '~/Projects/NightRider.nvim',
    priority = 1000,
    config = function()
        vim.cmd('colorscheme evilur')
    end
}
