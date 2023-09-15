return {
	"nvim-lualine/lualine.nvim",
	event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
	config = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn"},
			symbols = { error = "✘:", warn = "▲:"},
			colored = true,
			always_visible = true,
		}

		local location = {
			"location",
			padding = 0.5,
		}

		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diagnostics },
				lualine_x = {},
				lualine_y = { location },
				lualine_z = { "progress" },
			},
		})
	end,
}
