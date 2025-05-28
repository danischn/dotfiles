---------------------------------------------------------------
--- OPTIONS
---------------------------------------------------------------

vim.cmd.colorscheme("iben")
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard                                   



-- require("vim._extui").enable({})
vim.cmd "echo 'xxx'"
vim.opt.number = true
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.grepprg = "rg --vimgrep"

vim.opt.pumheight = 4
vim.opt.undofile = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.winborder = 'single'

vim.opt.smartindent = true

vim.opt.updatetime = 300
vim.opt.signcolumn = "yes:1"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.exrc = true

vim.opt.listchars = { tab = '>>', trail = '•', extends = "»", precedes = "«", nbsp= "+" }
vim.g.c_syntax_for_h = true

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

vim.keymap.set("n", "<leader>x", "<cmd>source %<cr>")
vim.keymap.set("n", "<leader>q", function()
  vim.cmd("vert copen")                      -- open quickfix window vertically
  local half_width = math.floor(vim.o.columns / 2)
  vim.cmd("vertical resize " .. half_width) -- resize to half the window width
end)

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>1", function()
  vim.o.cmdheight = 1 - vim.o.cmdheight
end, { desc = "Change cmdheight" })


vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)
vim.keymap.set("n", "<leader>;", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua manpages<cr>")

---------------------------------------------------------------
--- Autocmds
---------------------------------------------------------------

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 50 }
  end,
})

---------------------------------------------------------------
--- Plugins
---------------------------------------------------------------

require("paq")({
  "savq/paq-nvim",
	"nvim-treesitter/nvim-treesitter",
  "kylechui/nvim-surround",
  "williamboman/mason.nvim",
  "aserowy/tmux.nvim",
  "ibhagwan/fzf-lua",
  "stevearc/conform.nvim",
	"stevearc/quicker.nvim",
  "echasnovski/mini.files",
  "otavioschwanck/arrow.nvim",
	"mbbill/undotree",
	"mfussenegger/nvim-dap",
	"miroshQa/debugmaster.nvim",
})

---------------------------------------------------------------
--- Enabling the plugins
---------------------------------------------------------------

require("nvim-surround").setup()

require("nvim-treesitter.configs").setup({ highlight = { enable = true } })

require("mason").setup()

require("tmux").setup({
  copy_sync = false
})

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

require("arrow").setup({
  leader_key = "m",
  hide_handbook = true,
  mappings = {
    edit = "e",
    delete_mode = "r",
    clear_all_items = "C",
    toggle = "m",
    open_vertical = "v",
    open_horizontal = "-",
    quit = "q",
    remove = "x",
    next_item = "]",
    prev_item = "[",
  },
  index_keys = "asdfg",
})

require("fzf-lua").setup({
  { "default-title" },
  defaults = {
    file_icons = false,
    git_icons = false,
  },
  winopts = {
    border = "single",
    preview = {
      layout = "horizontal",
      delay = 10,
    },
  },
  -- Settings for files
  files = {
    winopts = {
      height = 0.3,
      width = 0.5,
    },
    fd_opts = [[--color=always --type f --follow --exclude .git]],
    previewer = false,
  },
  manpages = {
    winopts = {
      height = 0.3,
      width = 0.5,
    },
    previewer = false,
  },

  helptags = {
    winopts = {
      height = 0.3,
      width = 0.7,
    },
    previewer = false,
  }
})


require("quicker").setup({})

---------------------------------------------------------------
--- LSP
---------------------------------------------------------------

vim.lsp.enable({ "clangd", "luals" })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	vim.cmd("redraws")
end)

vim.keymap.set("n", "<leader>p", function()
	vim.diagnostic.open_float({border = "single"})
end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "grr", function() fzf.lsp_finder() end)
    vim.keymap.set("n", "<leader>s", function() fzf.lsp_workspace_symbols() end)
  end,
})

---------------------------------------------------------------
--- Winbar
---------------------------------------------------------------
vim.opt.winbar = table.concat({
  "%f",
  "%m",
})

---------------------------------------------------------------
--- Statusline
---------------------------------------------------------------
function _G.git_branch()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("%s+$", "") or ""
end

function _G.diagnostic_wrench()
  local enabled = vim.diagnostic.is_enabled()
  return enabled and "%#DiagnosticEnabled#%*" or "%#DiagnosticDisabled#%*"
end



-- Example usage in status line
vim.opt.statusline = table.concat({
  "%#StatusLineCWD#",
  "%{fnamemodify(getcwd(), ':~')} %*",
  "%{v:lua.git_branch()} ",
  "%{%v:lua.diagnostic_wrench()%} ",
	"%{toupper(mode())}",
})
