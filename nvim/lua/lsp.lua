vim.lsp.enable({ "clangd", "luals" })

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  vim.cmd("redraws")
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "grr", function() fzf.lsp_finder() end)
    vim.keymap.set("n", "<leader>p", function() vim.diagnostic.open_float({ scope = "line", border = "single" }) end)
  end,
})


vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  }
})

