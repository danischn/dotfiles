-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 50 })
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Save file when changing out of nvim
vim.api.nvim_create_autocmd("FocusLost", {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("wa")
		end
	end,
})
