return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"lua",
				"python",
				"regex",
				"markdown",
				"markdown_inline",
				"bash",
				"vim",
        "tsv",
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ai"] = { query = "@conditional.outer" },
						["ii"] = { query = "@conditional.inner" },

						["al"] = { query = "@loop.outer" },
						["il"] = { query = "@loop.inner" },

						["af"] = { query = "@function.outer" },
						["if"] = { query = "@function.inner" },

						["ac"] = { query = "@class.outer" },
						["ic"] = { query = "@class.inner" },
					},
				},
			},
		})
	end,
}
