vim.g.mapleader = ' '
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<Esc><Esc>', ':noh<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>p', '"+p', opts)
map('n', '<leader>P', '"+P', opts)
map('n', '<leader>o', 'o<Esc>k', opts)
map('n', '<leader>O', 'O<Esc>j', opts)
map({ 'n', 'v' }, '<leader>y', '"+y', opts)
map({ 'n', 'v' }, '<leader>Y', '"+y$', opts)

map('n', '<leader>u', ':colorscheme evilur<CR>', opts)
