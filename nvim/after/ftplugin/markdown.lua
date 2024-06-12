vim.b.minipairs_disable = true
vim.opt.list = true
vim.opt.conceallevel = 3
vim.opt.listchars = { trail = "_" }
vim.keymap.set("n", "<leader>o", function()
	local pdfname = vim.fn.expand("%:r") .. ".pdf"
	vim.system({ "open", pdfname })
end, { desc = "Open md-file in pdf-viewer" })
