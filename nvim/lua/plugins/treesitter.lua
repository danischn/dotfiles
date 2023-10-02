return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
        "lua",
        "python",
        "regex",
        "markdown",
        "markdown_inline",
        "bash",
        "vim",
      },
			highlight = { enable = true },
      indent = { enable = true },
		})
	end,
}
