return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  -- root_markers = {
  --   ".luarc.json",
  --   ".luarc.jsonc",
  -- },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "MiniFiles" },
      },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
}
