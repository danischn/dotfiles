---------------------------------------------------------------
--- OPTIONS
---------------------------------------------------------------

vim.cmd.colorscheme("iben")
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

vim.opt.number = true
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.showtabline = 0

vim.opt.winbar = "%f%m"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.grepprg = "rg --vimgrep"

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:ver25"

vim.opt.pumheight = 4
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.updatetime = 300
vim.opt.signcolumn = "yes:1"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.expandtab= true

vim.opt.listchars = { tab = '>>', trail = '•', extends = "»", precedes = "«", nbsp= "+"}

vim.opt.winborder = 'single'
vim.opt.exrc = true
vim.g.c_syntax_for_h = true

vim.cmd("cabbrev cd tcd")

---------------------------------------------------------------
--- Keymaps
---------------------------------------------------------------

vim.g.mapleader = " "
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>t", ":vertical term<cr>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

vim.keymap.set("n", "<leader>1", function()
  vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })

vim.keymap.set("n", "<leader>'", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua manpages<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>FzfLua lines<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")

vim.keymap.set("n", "[t", ":tabprev<CR>", { silent = true })
vim.keymap.set("n", "]t", ":tabnext<CR>", { silent = true })

vim.api.nvim_create_user_command("Tabn", function(opts)
  vim.t.tabTitle = opts.args
  vim.cmd.redrawstatus()
end, { nargs = 1 })

---------------------------------------------------------------
--- Autocmds
---------------------------------------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup("OnYankHighlight", {clear = true}),
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 50 })
  end,
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = vim.api.nvim_create_augroup("AutoOpenQF", {clear = true}),
	callback = function()
		vim.cmd("vert copen")
		local half_width = math.floor(vim.o.columns / 2)
		vim.cmd("vertical resize " .. half_width)
	end,
})

---------------------------------------------------------------
--- Plugins
---------------------------------------------------------------

local gh = "https://github.com/"
vim.pack.add({
  gh .. "nvim-treesitter/nvim-treesitter",
  gh .. "nvim-treesitter/nvim-treesitter-textobjects",
  gh .. "tpope/vim-surround",
  gh .. "williamboman/mason.nvim",
  gh .. "ibhagwan/fzf-lua",
  gh .. "stevearc/conform.nvim",
  gh .. "echasnovski/mini.files",
})

---------------------------------------------------------------
--- Enabling the plugins
---------------------------------------------------------------


require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
			},
		},
		move  = {
			enable = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@call.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@call.outer",
			},
		}
	}
})

require("mason").setup()

require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    markdown = { "prettier" },
    c = { "clang-format" },
    java = { "google-java-format" },
  },
  format_after_save = {}
})

require("mini.files").setup({
  mappings = {
    synchronize = "<cr>",
    go_in_plus = "l",
  },
  windows = {
    max_numer = 3,
    width_focus = 30,
    width_nofocus = 30,
  },
})
vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)
