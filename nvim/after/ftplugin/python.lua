vim.keymap.set("n", "<leader><cr>", function()
	vim.cmd("wa")
  local command = "clear; python3 " .. vim.fn.bufname("%")
	vim.cmd("call VimuxRunCommand('" .. command .. "')")
end, { desc = "Run file" })
