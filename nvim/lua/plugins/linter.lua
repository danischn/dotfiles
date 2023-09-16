return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	config = function()
		require("lint").linters_by_ft = {
			python = { "flake8" },
		}
		vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
