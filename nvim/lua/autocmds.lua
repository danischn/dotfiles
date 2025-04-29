-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank({ timeout = 50 }) end,
})

-- vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
--   callback = function()
--     local buf = vim.api.nvim_get_current_buf()
--     local modified = vim.api.nvim_get_option_value("modified", { buf = buf })
--     local readonly = vim.api.nvim_get_option_value("readonly", { buf = buf })
--     if modified and not readonly then
--       vim.cmd("w")
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
--   callback = function() vim.wo.cursorline = true end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
--   callback = function() vim.wo.cursorline = false end,
-- })
