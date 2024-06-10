return {
	{
		"aserowy/tmux.nvim",
		lazy = false,
		keys = {
			{ "<A-h>", "<cmd>lua require('tmux').resize_left()<cr>", { desc = "Resize left" } },
			{ "<A-j>", "<cmd>lua require('tmux').resize_bottom()<cr>", { desc = "Resize bottom" } },
			{ "<A-k>", "<cmd>lua require('tmux').resize_top()<cr>", { desc = "Resize top" } },
			{ "<A-l>", "<cmd>lua require('tmux').resize_right()<cr>", { desc = "Resize right" } },
		},
		opts = {
			copy_sync = {
				sync_clipboard = false,
			},
			resize = {
				enable_default_keybinds = false,
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

			-- Keymap for executing buffer i am in using vimux
			vim.keymap.set("n", "<leader><cr>", function()
				vim.cmd("wa")
				local filetype = vim.bo.filetype
				local command

				if filetype == "python" then
					command = "clear; python3 " .. vim.fn.bufname("%")
				elseif filetype == "lua" then
					command = "clear; lua " .. vim.fn.bufname("%")
				else
					print("Can't run this file")
					return
				end

				vim.cmd("call VimuxRunCommand('" .. command .. "')")
			end, { desc = "Run file" })
		end,
	},
}
