return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VimEnter",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					function()
						local cwd = vim.fn.getcwd()
						return vim.fn.fnamemodify(cwd, ":~")
					end,
					"filename",
					"branch",
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
		})
	end,
}
