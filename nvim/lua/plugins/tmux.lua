return {
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				copy_sync = {
					sync_clipboard = false,
				},
				resize = {
					enable_default_keybinds = false,
					resize_step_x = 3,
					resize_step_y = 3,
				},
			})
			vim.keymap.set("n", "<M-a>", "<cmd>lua require('tmux').resize_left()<cr>")
			vim.keymap.set("n", "<M-s>", "<cmd>lua require('tmux').resize_down()<cr>")
			vim.keymap.set("n", "<M-d>", "<cmd>lua require('tmux').resize_up()<cr>")
			vim.keymap.set("n", "<M-f>", "<cmd>lua require('tmux').resize_right()<cr>")
		end,
	},
	{
		"preservim/vimux",
		config = function()
			vim.g.VimuxOrientation = "h"
			vim.g.VimuxHeight = "40"
			-- vim.keymap.set("n", "<leader><cr>", function()
			-- 	vim.cmd("wa")
			-- 	vim.cmd("call VimuxRunCommand('ls')")
			-- end)
		end,
	},
}
