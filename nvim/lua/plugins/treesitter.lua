return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"c",
				"lua",
				"python",
				"regex",
				"markdown",
				"markdown_inline",
				"bash",
				"vim",
				"vimdoc",
				"query",
			},
		})
	end,
}
