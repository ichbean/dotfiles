vim.g.mapleader = ' '

vim.keymap.set('n', '<CR>', ':', {desc = 'Enter command'})
vim.keymap.set('n', '<BS>', 'ciw', {desc='Change word'})
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<C-s>', '<CMD>w<CR><ESC>', {desc = 'Save file'})
vim.keymap.set('n', '<ESC>', '<CMD>noh<CR>', {silent = true, desc = 'Clear search highlight'})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {desc = 'Move to bottom split'})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {desc = 'Move to top split'})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {desc = 'Move to right split'})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {desc = 'Move to left split'})
vim.keymap.set('n', 'c*', '*Ncgn', {desc = 'Replace word forwards'})
vim.keymap.set('n', 'c#', '#NcgN', {desc = 'Replace word backwards'})
vim.keymap.set('n', '<TAB>', '<CMD>bn<CR>', {desc = 'Next buffer'})
vim.keymap.set('n', '<S-TAB>', '<CMD>bp<CR>', {desc = 'Previous buffer'})
