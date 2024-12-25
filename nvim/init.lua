vim.cmd.colorscheme("iben") -- my own colorscheme
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 0 -- hide command bar
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- overrides ignorecase if search pattern contains upper case characters
vim.opt.hlsearch = true -- highlights searchs
vim.opt.pumheight = 4 -- pop up menu height
vim.opt.showmode = false -- Dont need to see mode in command line
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.splitbelow = true -- force all horizonal splits to go under the current window
vim.opt.termguicolors = true -- must be enabled
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.number = true -- set numbered lines
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor

vim.g.mapleader = " "
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>\\", "<C-w>v")
vim.keymap.set("n", "<leader>-", "<C-w>s")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>1", function()
	vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })

vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

-- Highlighted yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 50 })
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Save file when changing out of nvim
vim.api.nvim_create_autocmd("FocusLost", {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("wa")
		end
	end,
})

require("Lazy")

vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.enable("luals")
vim.lsp.enable("pyright")
