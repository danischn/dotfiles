return {
	"folke/noice.nvim",
	opts = {
		lsp = {
			hover = { enabled = false },
			signature = { enabled = false },
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
	},
	dependencies = { "MunifTanjim/nui.nvim" },
}
