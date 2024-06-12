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

-- Previewer for markdown to pdf
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local filename = vim.fn.expand("%")
		local pdfname = vim.fn.expand("%:r") .. ".pdf"
		vim.system({ "pandoc", filename, "-o", pdfname })
	end,
})
