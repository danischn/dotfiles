return {
	{
		"aserowy/tmux.nvim",
		opts = {
			copy_sync = {
				sync_clipboard = false,
			},
			resize = {
				resize_step_x = 3,
				resize_step_y = 3,
			},
		},
	},
	{
		"preservim/vimux",
		config = function()
			vim.g.VimuxOrientation = "h"
			vim.g.VimuxHeight = "40"
		end,
	},
}
