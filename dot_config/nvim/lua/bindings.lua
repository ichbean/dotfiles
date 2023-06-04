vim.g.mapleader = ' '
vim.g.localmapleader = ' '

vim.keymap.set('n', '<CR>', '<cmd>') -- Command with enter
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>') -- Save with Ctrl-s
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', {silent = true}) -- Clear search with esc
-- Move between splits
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
-- Replace word occurences
vim.keymap.set('n', 'c*', '*Ncgn') -- Forwards
vim.keymap.set('n', 'c#', '#NcgN') -- Backwards
