return {
"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>;", "<cmd>FzfLua files<cr>", desc = "Find file" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
		{ "<leader>h", "<cmd>FzfLua help_tags<cr>", desc = "Search: Helptags" },
		{ "<leader>k", "<cmd>FzfLua keymaps<cr>", desc = "Search: keymaps" },
	},
	config = function()
		require("fzf-lua").setup({
			--Global settings
			{ "default-title" },
			defaults = {
				file_icons = false,
				git_icons = false,
			},
			winopts = {
				border = "single",
				preview = {
					layout = "vertical",
					delay = 10,
				},
			},
			-- Settings for files
			files = {
				winopts = {
					height = 0.3,
					width = 0.5,
				},
				cwd_prompt = false,
				actions = { ["ctrl-g"] = false },
				fd_opts = [[--color=always --type f --hidden --follow]],
				previewer = false,
			},
		})
	end,
}
