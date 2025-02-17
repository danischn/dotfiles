return {
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
}
