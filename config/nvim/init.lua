vim.g.mapleader = ' '
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<Esc><Esc>', ':noh<CR>', opts)
map('n', '<leader>u', ':colorscheme evilur<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>p', '"+p', opts)
map('n', '<leader>P', '"+P', opts)
map('n', '<leader>o', 'o<Esc>k', opts)
map('n', '<leader>O', 'O<Esc>j', opts)
map({ 'n', 'v' }, '<leader>y', '"+y', opts)
map({ 'n', 'v' }, '<leader>Y', '"+y$', opts)

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end
})

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function()
        -- Save cursor position
        local pos = vim.api.nvim_win_get_cursor(0)

        -- Delete spaces at the end of lines
        vim.cmd([[%s/\s\+$//e]])

        -- Delete last blank line
        if vim.api.nvim_buf_get_lines(0, -2, -1, false)[1] == '' then
            vim.api.nvim_buf_set_lines(0, -2, -1, false, {})
        end

        -- Set the old cursor position
        vim.api.nvim_win_set_cursor(0, pos)
    end
})

vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.timeout = false
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.colorcolumn = '80'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('colorscheme evilur')
require('config.lazy')
