return {
    'Evilur/NightRider.nvim',
    lazy = false,
    dev = true,
    dir = '~/Projects/NightOwlSong.nvim',
    priority = 1000,
    config = function()
        vim.cmd('colorscheme night-owls-song')
    end
}
