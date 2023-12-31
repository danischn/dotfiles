return {
	"stevearc/conform.nvim",
	event = { "BufNewFile", "BufReadPre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "black" },
				lua = { "stylua" },
				markdown = { "prettier" },
				bash = { "beautysh" },
				yaml = { "prettier" },
				json = { "prettier" },
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format()
		end)
	end,
}
