return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	config = function()
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
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
		})
	end,
}
