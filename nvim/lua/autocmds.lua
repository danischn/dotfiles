-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})

-- No autopairs in markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.b.minipairs_disable = true
	end,
})

-- Previewer for markdown to pdf
local viewer_closed = true
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.md",
	callback = function()
		local filename = vim.fn.expand("%")
		local pdfname = vim.fn.expand("%:r") .. ".pdf"
		vim.system({ "pandoc", filename, "-o", pdfname }, {}, function()
			if viewer_closed then
				vim.system({ "open", pdfname }, {})
				viewer_closed = false
			end
		end)
	end,
})
