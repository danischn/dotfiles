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
				lualine_b = {
					function()
						local cwd = vim.fn.getcwd()
						return vim.fn.fnamemodify(cwd, ":~")
					end,
				},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "branch" },
				lualine_z = { "progress" },
			},
		})
	end,
}
