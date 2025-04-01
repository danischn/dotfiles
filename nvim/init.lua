require("options")
require("keymaps")
require("autocmds")
require("fzf")
require("lsp")

require("paq")({
  "savq/paq-nvim", -- Let Paq manage itself
  "kylechui/nvim-surround",
  "williamboman/mason.nvim",
  "aserowy/tmux.nvim",
  "folke/zen-mode.nvim",
  "ibhagwan/fzf-lua",
  "stevearc/conform.nvim",
  "nvim-treesitter/nvim-treesitter",
  "echasnovski/mini.files",
  -- Vim plugins:
  "preservim/vimux",
  "jpalardy/vim-slime",
  "ludovicchabant/vim-gutentags",
  "tpope/vim-fugitive",
})

------------- Enabling the plugins -------------

require("nvim-surround").setup()
require("debugprint").setup()
require("mason").setup()
require("tmux").setup({ copy_sync = false })
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })
require("zen-mode").setup({
  window = {
    width = 100 },
    plugins = {
      tmux = {
        enabled = true
      }
    },
})

require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    markdown = { "prettier" },
    c = { "clang-format" },
    java = { "google-java-format" },
  },
  format_on_save = {}
})

require("mini.files").setup({
  mappings = {
    synchronize = "<CR>",
    go_in_plus = "l",
  },
  windows = {
    max_numer = 3,
    width_focus = 20,
    width_nofocus = 15,
  },
})

------------- Keymaps for small plugins -------------

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")
vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)

------------- Options for vim plugins -------------

vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "40"
