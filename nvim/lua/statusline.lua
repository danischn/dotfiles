-- Active statusline (full details)
local active_statusline = table.concat({
  " %{toupper(mode())}",
  " | ",
  "%f",
  " | ",
  " %{FugitiveHead()} ",
  "%= ",
  "[%l:%c] ",
})

-- Inactive statusline (simplified)
local inactive_statusline = table.concat({
  "%=",
  "%#Statement#",
  "%t",
  "%*",
  "%=",
})

vim.opt.statusline = inactive_statusline
vim.wo.statusline = active_statusline

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.wo.statusline = active_statusline
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.wo.statusline = inactive_statusline
  end,
})
