return {
	--Colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	--Autopairs
	{
		"echasnovski/mini.pairs",
		version = false,
		event = "VeryLazy",
		config = true,
	},
	--Surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = true,
	},
	--Comment
	{
		"numToStr/Comment.nvim",
		event = { "BufRead", "BufNewFile" },
		opts = {
			toggler = {
				line = "<leader>c",
			},
			opleader = {
				line = "<leader>c",
			},
		},
	},
	--Zenmode
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = {
			window = {
				width = 110,
			},
			plugins = {
				options = {
					laststatus = 0,
				},
				tmux = {
					enabled = true,
				},
			},
		},
	},
	--Split and join
	{
		"Wansmer/treesj",
		keys = { { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Split&Join" } },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local lang_utils = require("treesj.langs.utils")
			require("treesj").setup({
				use_default_keymaps = false,
				langs = {
					python = {
						object = lang_utils.set_preset_for_dict(),
					},
				},
			})
		end,
	},
	--File explorer
	{
		"echasnovski/mini.files",
		version = false,
		keys = { { "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Explorer" } },
		opts = {
			mappings = {
				go_in_plus = "l",
				synchronize = "<cr>",
			},
			windows = {
				max_number = 3,
				width_focus = 28,
				width_nofocus = 28,
			},
			options = {
				permanent_delete = false,
			},
		},
	},
	--UndoTree
	{
		"mbbill/undotree",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" } },
	},
}
