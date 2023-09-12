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
		opts = { toggler = { line = "<leader>c" }, opleader = { line = "<leader>c" } },
	},
	--Tabout
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		opts = { ignore_beginning = false },
	},
	--Zenmode
	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode" } },
		opts = { window = { width = 100 }, plugins = { tmux = { enabled = true } } },
	},
	--Split and join
	{
		"Wansmer/treesj",
		keys = { { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Split&Join" } },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})
		end,
	},
	--Terminal
	{
		"numToStr/FTerm.nvim",
		keys = { { "<leader>t", ":w <bar> lua require('FTerm').toggle()<cr>", desc = "Toggle Terminal" } },
		config = function()
			require("FTerm").setup({
				border = "double",
				dimensions = { height = 0.9, width = 0.9 },
			})
      vim.keymap.set("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		end,
	},
	--UndoTree
	{
		"mbbill/undotree",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTree" } },
	},
  --Markdown
  {
    'jakewvincent/mkdnflow.nvim',
    config = function()
        require('mkdnflow').setup()
    end,
  },
  { "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow"
  },
}
