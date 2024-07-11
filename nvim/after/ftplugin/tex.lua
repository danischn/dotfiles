vim.opt_local.spell = true
vim.opt_local.spelllang = { "nb", "en" }

vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("w")
	vim.cmd("VimtexCompileSS")
end, { buffer = 0, desc = "Latex: Compile current file to latex" })
