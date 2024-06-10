-- Shorten function name
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<ESC>", "<cmd>nohlsearch<cr>")
map("n", "J", "mzJ`z")
map("i", "jk", "<ESC>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("v", "p", "P")

-- Change cmdheight
map("n", "<leader>1", function()
	vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })

-- Map for running file
map("n", "<leader><cr>", function()
	vim.cmd("wa")
	local filetype = vim.bo.filetype
	local command

	if filetype == "python" then
		command = "clear; python3 " .. vim.fn.bufname("%")
	elseif filetype == "lua" then
		command = "clear; lua " .. vim.fn.bufname("%")
	else
		print("Can't run this file")
		return
	end

	vim.cmd("call VimuxRunCommand('" .. command .. "')")
end, { desc = "Run file" })
