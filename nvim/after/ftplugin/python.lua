vim.keymap.set("n", "<leader><cr>", function()
  vim.cmd("wa")
  local filepath = vim.fn.expand("%:p")
  local command = "clear; python3 " .. filepath
  vim.cmd(string.format("call VimuxRunCommand('%s')", command))
end, { buffer = 0, desc = "Run python file" })

vim.lsp.start({
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json" },
  single_file_support = true,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})
