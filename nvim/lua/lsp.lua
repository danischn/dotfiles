vim.lsp.enable({ "clangd", "luals" })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
  vim.cmd("redraws")
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "grr", function() fzf.lsp_finder() end)
    vim.keymap.set("n", "<leader>s", function() fzf.lsp_workspace_symbols() end)
  end,
})



vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
  callback = function()
    vim.diagnostic.open_float({ focus = false, border = "single" })
  end
})
