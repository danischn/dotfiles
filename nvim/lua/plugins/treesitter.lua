return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "lua", "python", "html", "markdown", "markdown_inline" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
