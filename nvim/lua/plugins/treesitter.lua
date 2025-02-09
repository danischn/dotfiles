return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  enabled = false,
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({ highlight = { enable = true } })
  end,
}
