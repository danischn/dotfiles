vim.keymap.set("n", "<leader><cr>", function()
  vim.cmd("wa")
  local command = "clear; gcc -g " .. vim.fn.bufname("%") .. " && ./a.out"
  vim.cmd(string.format("call VimuxRunCommandInDir('%s', 0)", command))
end, { buffer = 0, desc = "Run C file" })

vim.lsp.start({
  cmd = { "clangd" },
  filetypes = { "c" },
  root_markers = { ".clangd", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { "utf-8", "utf-16" },
  },
})
