-- Shorten function name
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<esc>", "<cmd>nohlsearch<cr>")
map("n", "J", "mzJ`z")
map("i", "jk", "<ESC>")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Change cmdheight
map("n", "<leader>1", function()
	vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })
