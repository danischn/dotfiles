local function scratch_buffer()
    local bufname = "Scratch"
    local sbuf
    if vim.fn.bufexists(bufname) == 1 then
        sbuf = vim.fn.bufnr(bufname)
    else
        sbuf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(sbuf, bufname)
    end

    vim.api.nvim_open_win(sbuf, true, {
        split = "right",
        win = 0
    })

    vim.api.nvim_set_option_value("filetype", "lua", {})
end

vim.keymap.set("n", "<leader>s", function() scratch_buffer() end)
