vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+y$', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', ':colorscheme evilur<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>o', 'o<Esc>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>O', 'O<Esc>j', { noremap = true, silent = true })
vim.keymap.set({ 'i', 'c' }, 'jk', '<Esc>', { noremap = true, silent = true })

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
