return {
	"nvim-telescope/telescope.nvim",
	cond = false,
	cmd = "Telescope",
	keys = {
		{ "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<Esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				help_tags = {
					theme = "dropdown",
					previewer = false,
				},
				live_grep = {
					theme = "dropdown",
				},
			},
			extensions = {
				fzf = {},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
