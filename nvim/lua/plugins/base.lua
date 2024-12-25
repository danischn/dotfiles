return {
	{ "echasnovski/mini.surround", opts = {} },
	{ "norcalli/nvim-colorizer.lua" },
	{ "eoh-bse/minintro.nvim", opts = {} },
	{ "williamboman/mason.nvim", opts = {} },
	{ "aserowy/tmux.nvim", opts = {} },
	{
		"preservim/vimux",
		config = function()
			vim.g.VimuxOrientation = "h"
			vim.g.VimuxHeight = "40"
		end,
	},
	{
		"folke/zen-mode.nvim",
		keys = { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" },
		opts = { plugins = { tmux = { enabled = true } } },
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
