return {
	{ "kylechui/nvim-surround", opts = {} },
	{ "eoh-bse/minintro.nvim", opts = {} },
	{ "williamboman/mason.nvim", opts = {} },
	{ "aserowy/tmux.nvim", opts = { copy_sync = false } },
	{ "norcalli/nvim-colorizer.lua", opts = {} },

	{
		"preservim/vimux",
		config = function()
			vim.g.VimuxOrientation = "h"
			vim.g.VimuxHeight = "40"
		end,
	},
	{
		"jpalardy/vim-slime",
		init = function()
			vim.g.slime_target = "tmux"
			vim.g.slime_dont_ask_default = 1
			vim.g.slime_default_config = { socket_name = "default", target_pane = "{right-of}" }
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = { window = { width = 100 }, plugins = { tmux = { enabled = true } } },
	},
}
