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
