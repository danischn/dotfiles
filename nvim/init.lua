require("options")
require("keymaps")
require("autocmds")
require("lsp")
require("fzf")
require("mini-files")

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
  "otavioschwanck/arrow.nvim",
  -- Vim plugins:
  "preservim/vimux",
  "jpalardy/vim-slime",
  "tpope/vim-fugitive",
})

------------- Enabling the plugins -------------

require("nvim-surround").setup()
require("mason").setup()
require("tmux").setup({ copy_sync = false })
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })

require("zen-mode").setup({
  window = { width = 100 },
    plugins = { tmux = { enabled = true } },
  }
)
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")


require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    markdown = { "prettier" },
    c = { "clang-format" },
    java = { "google-java-format" },
  },
  format_on_save = {}
})

require("arrow").setup({
  leader_key = "m",
  hide_handbook = true,
  mappings = {
    edit = "e",
    delete_mode = "r",
    clear_all_items = "C",
    toggle = "m", -- used as save if separate_save_and_remove is true
    open_vertical = "v",
    open_horizontal = "-",
    quit = "q",
    remove = "x", -- only used if separate_save_and_remove is true
    next_item = "]",
    prev_item = "[",
  },
  index_keys = "asdfg",
})

------------- Options for vim plugins -------------

vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "40"
