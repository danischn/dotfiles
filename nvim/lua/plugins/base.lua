return {
	{ "kylechui/nvim-surround", opts = {} },
	{ "norcalli/nvim-colorizer.lua" },
	{ "eoh-bse/minintro.nvim", lazy = false, opts = {} },
	{ "williamboman/mason.nvim", opts = {} },
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = { plugins = { tmux = { enabled = true } } },
	},
	{
		"echasnovski/mini.files",
		version = false,
		keys = { { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Explorer" } },
		opts = {
			mappings = { go_in_plus = "l", synchronize = "<cr>" },
			windows = { max_number = 3, width_focus = 28, width_nofocus = 28 },
			options = { permanent_delete = false },
		},
	},
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_dont_ask_default = 1
			vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
		end,
	},
}
