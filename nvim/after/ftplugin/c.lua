vim.keymap.set("n", "<leader><cr>", function()
  vim.cmd("wa")
  local command = "clear; gcc -g " .. vim.fn.bufname("%") .. " && ./a.out"
  vim.cmd(string.format("call VimuxRunCommandInDir('%s', 0)", command))
end, { buffer = 0, desc = "Run C file" })

local function add_newline()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()
  local node = vim.treesitter.get_node({pos = {row - 1, #current_line - 1}})

  if node:type() ~= "expression_statement" then
    return
  end

  call_expression = node:child(0)
  print(vim.treesitter.get_node_text(call_expression, 0))

  func = call_expression:child(0)
  print(vim.treesitter.get_node_text(func, 0))

  arguments = call_expression:child(1)

  string_literal = arguments:child(1)

  string_content = string_literal:child(1)


  local append_new_line = vim.treesitter.get_node_text(string_content, 0) .. "\\n"
  print(append_new_line)

end


vim.keymap.set("n", "<leader>r", ": so ~/.config/nvim/after/ftplugin/c.lua <cr>")
vim.keymap.set("n", "<leader>n", add_newline)
