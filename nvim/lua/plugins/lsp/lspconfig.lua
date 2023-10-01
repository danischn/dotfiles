return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = "hrsh7th/cmp-nvim-lsp",
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
  end,
}
