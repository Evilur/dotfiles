-- Clear the document before saving --
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
