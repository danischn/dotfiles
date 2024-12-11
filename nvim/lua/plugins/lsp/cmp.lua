return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	build = "cargo build --release",
	opts = {
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-o>"] = { "select_and_accept" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		menu = {
			enabled = true,
			min_width = 15,
			max_height = 10,
			border = "none",
			winblend = 0,
			winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			scrolloff = 2,
			scrollbar = true,
			direction_priority = { "s", "n" },
			auto_show = true,
			draw = {
				align_to_component = "label", -- or 'none' to disable
				padding = 1,
				gap = 1,
				treesitter = false,
				columns = { { "label", "label_description", gap = 1 },{ "kind_icon" } },
			},
		},
		completion = {
			list = {
				max_items = 4,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
}
