require("options")
require("keymaps")
require("autocmds")
require("statusline")

require("paq")({
  "savq/paq-nvim",
  "kylechui/nvim-surround",
  "williamboman/mason.nvim",
  "aserowy/tmux.nvim",
  "preservim/vimux",
  "jpalardy/vim-slime",
  "folke/zen-mode.nvim",
})

require("nvim-surround").setup()
require("mason").setup()
require("tmux").setup({copy_sync = false})
require("zen-mode").setup()
