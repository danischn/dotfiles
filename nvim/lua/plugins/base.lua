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
	--Better text objects
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		config = true,
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
		opts = { toggler = { line = "<leader>c" }, opleader = { line = "<leader>c" } },
	},
	--Zenmode
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = { window = { width = 110 }, plugins = { tmux = { enabled = true } } },
	},
	--Split and join
	{
		"Wansmer/treesj",
		keys = { { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Split&Join" } },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { use_default_keymaps = false },
	},
	--Terminal
	{
		"numToStr/FTerm.nvim",
		keys = { { "<M-s>", "<cmd>lua require('FTerm').toggle()<cr>", desc = "Toggle Terminal" } },
		config = function()
			require("FTerm").setup({ border = "double", dimensions = { height = 0.9, width = 0.9 } })
			vim.keymap.set("t", "<M-s>", '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>')
		end,
	},
	--UndoTree
	{
		"mbbill/undotree",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" } },
	},
	--Markdown Previewer
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		keys = { { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	--Markdownflow
	{
		"jakewvincent/mkdnflow.nvim",
		config = true,
	},
	--Leap
	{
		"ggandor/leap.nvim",
		keys = { "s", "S" },
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps()
		end,
	},
}
