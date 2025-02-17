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
  -- Vim plugins:
  "preservim/vimux",
  "jpalardy/vim-slime",
})

require("nvim-surround").setup()
require("mason").setup()
require("tmux").setup({ copy_sync = false })

require("zen-mode").setup({ window = { width = 100 }, plugins = { tmux = { enabled = true } } })
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>")

require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    lua = { "stylua" },
    markdown = { "prettier" },
    c = { "clang-format" },
  },
})
vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<cr>")

vim.lsp.enable("clangd")
