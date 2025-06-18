vim.g.mapleader = ' '
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- System Clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', opts)
map({ 'n', 'v' }, '<leader>Y', '"+y$', opts)
map('n', '<leader>p', '"+p', opts)
map('n', '<leader>P', '"+P', opts)

-- Buffers
map('n', '<leader>x', ':Bdelete<CR>', opts)
map('n', '<leader>j', ':bp<CR>', opts)
map('n', '<leader>k', ':bn<CR>', opts)
map('n', '<leader>0', ':bf<CR>', opts)
map('n', '<leader>$', ':bl<CR>', opts)

-- QoL
map('n', '<Esc><Esc>', ':noh<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>o', 'o<Esc>k', opts)
map('n', '<leader>O', 'O<Esc>j', opts)
map('n', '<leader>u', ':colorscheme evilur<CR>', opts)

-- Build
map('n', '<F5>', ':terminal make run<CR>', opts)
map('n', '<leader>O', 'O<Esc>j', opts)

-- Lsp
map('n', '<F2>', ':lua vim.lsp.buf.rename()<CR>', opts)
