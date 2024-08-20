return {
	{
		"Verf/deepwhite.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("deepwhite")
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = { "BufRead", "BufNewFile" },
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufRead", "BufNewFile" },
		opts = {
			toggler = {
				line = "<leader>c",
			},
			opleader = {
				line = "<leader>c",
			},
		},
	},
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = {
			window = {
				width = 100,
			},
			plugins = {
				options = {
					laststatus = 0,
				},
				tmux = {
					enabled = true,
				},
			},
		},
	},
	{
		"echasnovski/mini.files",
		version = false,
		keys = { { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Explorer" } },
		opts = {
			mappings = {
				go_in_plus = "l",
				synchronize = "<cr>",
			},
			windows = {
				max_number = 3,
				width_focus = 28,
				width_nofocus = 28,
			},
			options = {
				permanent_delete = false,
			},
		},
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "sioyek"
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},
}
