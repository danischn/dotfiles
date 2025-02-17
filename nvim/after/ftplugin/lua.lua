vim.lsp.start({
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = vim.fs.root(0, { ".luarc.json", ".luarc.jsonc" }),
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
