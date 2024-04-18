-- Jump to the last cursor position in an opened file
vim.api.nvim_create_autocmd('BufReadPost', {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = vim.api.nvim_create_augroup(
        'cmdheight_1_on_cmdlineenter',
        { clear = true }
    ),
    desc = 'Don\'t hide the status line when typing a command',
    command = ':set cmdheight=1',
})

vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = vim.api.nvim_create_augroup(
        'cmdheight_0_on_cmdlineleave',
        { clear = true }
    ),
    desc = 'Hide cmdline when not typing a command',
    command = ':set cmdheight=0',
})

vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup(
        'hide_message_after_write',
        { clear = true }
    ),
    desc = 'Get rid of message after writing a file',
    pattern = { '*' },
    command = 'redrawstatus',
})
