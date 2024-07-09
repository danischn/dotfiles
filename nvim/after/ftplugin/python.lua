vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("wa")
	local filepath = vim.fn.expand("%:p")
	local command = "clear; python3 " .. filepath
	vim.cmd(string.format("call VimuxRunCommand('%s')", command))
end, { buffer = 0, desc = "Run python file" })
