vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup("Typst", {clear = true}),
  buffer = 0,
  callback = function()
    vim.cmd("silent! make")
  end,
})
