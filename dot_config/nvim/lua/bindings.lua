vim.g.mapleader = ' '
vim.g.localmapleader = ' '

vim.keymap.set('n', '<CR>', ':') -- Command with enter
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<C-s>', '<CMD>w<cr><ESC>') -- Save with Ctrl-s
vim.keymap.set('n', '<ESC>', '<CMD>noh<CR>', {silent = true}) -- Clear search with ESC
-- Move between splits
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
-- Replace word occurences
vim.keymap.set('n', 'c*', '*Ncgn') -- Forwards
vim.keymap.set('n', 'c#', '#NcgN') -- Backwards
-- Cycle through buffers
vim.keymap.set('n', '<TAB>', '<CMD>bn<CR>')
vim.keymap.set('n', '<S-TAB>', '<CMD>bp<CR>')
