vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("wa")
	local filepath = vim.fn.expand("%:p")
	local command = string.format("clear; python3 %s", filepath)
	vim.cmd(string.format("call VimuxRunCommand('%s')", command))
end, { desc = "Run file" })