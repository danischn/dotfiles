vim.keymap.set("n", "<leader><cr>", function()
  vim.cmd("wa")
  local command = "clear; gcc -g " .. vim.fn.bufname("%") .. " && ./a.out"
  vim.cmd(string.format("call VimuxRunCommandInDir('%s', 0)", command))
end, { buffer = 0, desc = "Run C file" })
