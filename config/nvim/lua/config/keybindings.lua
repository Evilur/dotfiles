vim.g.mapleader = ' '
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- System Clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', opts)
map({ 'n', 'v' }, '<leader>Y', '"+y$', opts)
map('n', '<leader>p', '"+p', opts)
map('n', '<leader>P', '"+P', opts)

-- Buffers
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>x', ':bdelete<CR>', opts)
map('n', '<leader>j', ':bprev<CR>', opts)
map('n', '<leader>k', ':bnext<CR>', opts)
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
map('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opts)

-- Misc
map('n', '<Esc><Esc>', ':noh<CR>', opts)
map('n', '<leader>o', 'o<Esc>k', opts)
map('n', '<leader>O', 'O<Esc>j', opts)

-- Nvim Tree
map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

-- Build
map('n', '<F5>', ':belowright terminal make -f nvim.Makefile run<CR>i', opts)
map('n', '<F7>', ':belowright terminal make -f nvim.Makefile clean<CR>i', opts)

-- Lsp
map('n', '<leader>rn', vim.lsp.buf.rename, opts)
map('n', '<leader>gd', vim.lsp.buf.definition, opts)
map('n', '<leader>gr', vim.lsp.buf.references, opts)
map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
map('n', 'K', vim.diagnostic.open_float, opts)
map('n', '<leader>K', vim.lsp.buf.hover, opts)
