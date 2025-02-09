return {
	"stevearc/conform.nvim",
	keys = { { "<leader>f", "<cmd>lua require('conform').format()<cr>", desc = "Format Document" } },
	opts = {
		formatters_by_ft = {
			python = { "black" },
			lua = { "stylua" },
			markdown = { "prettier" },
			c = { "clang-format" },
		},
	},
}
