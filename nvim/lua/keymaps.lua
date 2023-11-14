-- Shorten function name
local map = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
--Better Scrolling(from thePrimeagen)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
--Remap space as leader keys
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Better join
map("n", "J", "mzJ`z")
-- Better paste
map("v", "p", "P", opts)
-- Insert --
-- Press jk fast to enter
map("i", "jk", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Change cmdheight
map("n", "<leader>1", function()
	if vim.o.cmdheight == 1 then
		vim.o.cmdheight = 0
	else
		vim.o.cmdheight = 1
	end
end)
