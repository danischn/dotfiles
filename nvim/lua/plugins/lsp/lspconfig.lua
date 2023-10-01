return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = "hrsh7th/cmp-nvim-lsp",
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      


  end,
}
