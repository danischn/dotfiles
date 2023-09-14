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
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)
-- Clear highlights
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
-- Better paste
map("v", "p", "P", opts)
-- Insert --
-- Press jk fast to enter
map("i", "jk", "<ESC>", opts)
-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

--Maps for running code
map("n", "<leader><cr>", ":w <bar> lua require('FTerm').run({'py', vim.fn.expand(\"%:.\")})<CR>", opts)
