require("options")
require("keymaps")
require("autocmds")
require("statusline")
require("fzf")

require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "kylechui/nvim-surround",
  "williamboman/mason.nvim",
  "aserowy/tmux.nvim",
  "folke/zen-mode.nvim",
  "ibhagwan/fzf-lua",
  "stevearc/conform.nvim",
  "stevearc/conform.nvim",
  "nvim-treesitter/nvim-treesitter",
  -- Vim plugins:
  "preservim/vimux",
  "jpalardy/vim-slime",
})

-- Enabling the plugins
require("nvim-surround").setup()
require("mason").setup()
require("tmux").setup({ copy_sync = false })
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })
require("zen-mode").setup({ window = { width = 100 }, plugins = { tmux = { enabled = true } } })
require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    lua = { "stylua" },
    markdown = { "prettier" },
    c = { "clang-format" },
    java = { "google-java-format" },
  },
})

-- Keymap and options for plugins
vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")
vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "40"

-- Lsp
vim.lsp.enable("clangd")
