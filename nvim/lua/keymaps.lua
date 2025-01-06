vim.g.mapleader = " "
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>\\", "<C-w>v")
vim.keymap.set("n", "<leader>-", "<C-w>s")

vim.keymap.set("i", "<BS>", function()
	print("Use Control-(H/W/U) instead")
end)

vim.keymap.set("n", "<bs>", "<nop>")

vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>1", function()
	vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })

vim.keymap.set("n", "<leader>.", function()
	vim.uv.chdir(vim.fn.expand("~/dotfiles/nvim"))
end)

vim.keymap.set("n", "<leader>i", "<cmd>colo iben<CR>")
