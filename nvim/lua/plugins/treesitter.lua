return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  enabled = true,
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({ highlight = { enable = true } })
  end,
}
