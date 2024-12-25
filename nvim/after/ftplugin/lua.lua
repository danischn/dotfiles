vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("wa")
	local filepath = vim.fn.expand("%:p")
	local command = string.format("clear; lua %s", filepath)
	vim.cmd(string.format("call VimuxRunCommand('%s')", command))
end, { buffer = 0, desc = "Run lua file" })

vim.keymap.set("n", "<leader>.", function()
	vim.uv.chdir(vim.fn.expand("~/dotfiles/nvim"))
end)

vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { buffer = 0, desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { buffer = 0, desc = "Execute the current file" })
