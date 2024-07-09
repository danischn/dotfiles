vim.opt_local.number = false
vim.opt_local.list = true
vim.opt_local.listchars = { trail = "_" }
vim.opt_local.conceallevel = 3
vim.opt_local.textwidth = 78

vim.keymap.set("n", "<leader>o", function()
	local pdfname = vim.fn.expand("%:r") .. ".pdf"
	if vim.fn.filereadable(pdfname) == 1 then
		vim.fn.system({ "open", pdfname })
	else
		print("PDF file does not exist. Compile it first")
	end
end, { buffer = 0, desc = "Markdown: Open current file as pdf in viewer" })

vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("w")
	local filename = vim.fn.expand("%")
	local pdfname = vim.fn.expand("%:r") .. ".pdf"
	vim.system({ "pandoc", filename, "-o", pdfname })
end, { buffer = 0, desc = "Markdown: Compile current file to pdf" })
