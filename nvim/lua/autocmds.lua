-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
})

-- Disable semantic highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    end
  end,
})
