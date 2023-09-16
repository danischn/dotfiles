local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
function M.config()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
    ensure_installed = { "lua", "python", "html" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
