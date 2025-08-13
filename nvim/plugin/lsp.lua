vim.lsp.enable({ "clangd", "luals" })

vim.keymap.set("n", "<leader>n", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	vim.cmd.redrawstatus()
end)

vim.keymap.set("n", "<leader>p", function()
    vim.diagnostic.open_float()
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(_)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  end,
})
