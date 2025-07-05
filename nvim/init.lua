---------------------------------------------------------------
--- OPTIONS
---------------------------------------------------------------

vim.cmd.colorscheme("iben")
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard


-- require("vim._extui").enable({enable = true})

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
vim.cmd("cabbrev a pappa")

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
vim.keymap.set("n", "<leader>s", function() scratch_buffer() end)
vim.keymap.set("n", "<leader>q", function()
  vim.cmd("vert copen")                      -- open quickfix window vertically
  local half_width = math.floor(vim.o.columns / 2)
  vim.cmd("vertical resize " .. half_width) -- resize to half the window width
end)

vim.keymap.set("n", "<leader>,", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("tcd " .. dir)
end)

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

vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)
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

require("paq")({
  "savq/paq-nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "kylechui/nvim-surround",
  "williamboman/mason.nvim",
  "ibhagwan/fzf-lua",
  "stevearc/conform.nvim",
  "stevearc/quicker.nvim",
  "echasnovski/mini.files",
  "otavioschwanck/arrow.nvim",
  "mfussenegger/nvim-dap",
  "igorlfs/nvim-dap-view",
  "nvimtools/hydra.nvim",
})

---------------------------------------------------------------
--- Enabling the plugins
---------------------------------------------------------------

require("nvim-surround").setup()

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

require("quicker").setup({})

-------------------------------------------------------------
-- FZF
-------------------------------------------------------------

require("fzf-lua").setup({
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
  actions = {
    files = {
      true,
      ["ctrl-t"] = function(selected, opts)
        local cwd = opts.cwd or vim.fn.getcwd()
        vim.cmd.tabnew(cwd .. "/" .. selected[1])
        vim.cmd("silent! tcd " .. cwd .. "/" .. vim.fn.fnamemodify(selected[1], ":h"))
      end,
      ["ctrl-u"] = function(_, opts)
        local parent = vim.fn.fnamemodify(opts.cwd or vim.fn.getcwd(), ":h")
        require("fzf-lua").files({ cwd = parent })
      end
    }
  },
  files = {
    winopts = {
      height = 0.3,
      width = 0.6,
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

---------------------------------------------------------------
--- LSP
---------------------------------------------------------------

vim.lsp.enable({ "clangd", "luals" })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	vim.cmd.redrawstatus()
end)

vim.keymap.set("n", "<leader>p", function()
    vim.diagnostic.open_float()
  end)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(_)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  end,
})



---------------------------------------------------------------
--- Statusline
---------------------------------------------------------------

vim.api.nvim_create_autocmd({'BufEnter', 'DirChanged'}, {
  group = vim.api.nvim_create_augroup("GitBranchSTL", {clear = true}),
  callback = function()
    local command = {"git", "branch", "--show-current"}
    local obj  = vim.system(command, { cwd = vim.fn.getcwd(0, 0), text = true }):wait()
    if obj.code == 0 then
      vim.b.git_branch = string.gsub(obj.stdout, "\n", "")
    else
      vim.b.git_branch = ""
    end
    vim.cmd.redrawstatus()
  end
})

local function stl_mode()
  local mode = vim.fn.toupper(vim.api.nvim_get_mode().mode)
  local text = "%#StatuslineMode# " .. mode .. " %* "
  return text, #mode + 3
end

local function stl_cwd() -- Relative to tab
  local function truncate(cwd)
    local path, n = string.gsub(cwd, "~", "")
    local split = vim.split(path , "/", { trimempty = true })
    local max_path_len = 3  
    if #split <= max_path_len then
      return cwd
    else  
      return ".../" .. table.concat(split, "/", #split - 2) 
    end
  end
  local cwd = truncate(vim.fn.fnamemodify(vim.fn.getcwd(0, 0), ':~'))
  local text = "%#StatusLineCWD#" .. cwd .. "%* "
  return text, #cwd + 1
end

local function stl_git_branch()
  if vim.b.git_branch and vim.b.git_branch ~= "" then
    return "#" .. vim.b.git_branch, #vim.b.git_branch + 1
  end
  return "", 0
end

local function stl_workspaces()
  local tabline = {}
  local currentTab = vim.api.nvim_get_current_tabpage()

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    table.insert(tabline, currentTab == tab and "%#TabLineSel#" or "%#TabLine#")
    table.insert(tabline, " " .. (vim.t[tab].tabTitle or vim.api.nvim_tabpage_get_number(tab)) .. " ")
  end

  return table.concat(tabline)
end

function Statusline_render()
  local left_len = 0
  local left = ""
  local segments = {stl_mode, stl_cwd, stl_git_branch}
  for _, f in ipairs(segments) do
    local text, len = f()
    left_len = left_len + len
    left = left .. text
  end
  local center = stl_workspaces()
  local right = string.rep(" ", left_len)
  return left .. "%=" .. center .. "%=" .. right
end

vim.opt.statusline = "%{%v:lua.Statusline_render()%}"

---------------------------------------------------------------
--- Miscellaneous
---------------------------------------------------------------

local function scratch_buffer()
    local bufname = "Scratch"
    local sbuf
    if vim.fn.bufexists(bufname) == 1 then
        sbuf = vim.fn.bufnr(bufname)
    else
        sbuf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_name(sbuf, bufname)
    end

    vim.api.nvim_open_win(sbuf, true, {
        split = "right",
        win = 0
    })

    vim.api.nvim_set_option_value("filetype", "lua", {})
end

vim.keymap.set("n", "<leader>s", function() scratch_buffer() end)

---------------------------------------------------------------
--- Debugger
---------------------------------------------------------------

vim.dap = require("dap")
vim.dap.defaults.fallback.switchbuf = 'usevisible,usetab,uselast'

require("dap-view").setup({
  auto_toggle = true,
  windows = {
    height = 15,
    terminal = {
      position = "right",
      width = 0.3
    }
  },
})

local Hydra = require("hydra")
Hydra({
    name = "Debug",
    mode = "n",
    body = "<leader>d",
    config = {
    invoke_on_body = true,
    color = "pink",
    hint = { position = "top-right" }
  },
  hint =
[[
_c_ : continue 
_b_ : breakpoint 
_n_ : next 
_s_ : step into 
_o_ : step out
_a_ : restart(again)
_q_ : terminate
]],
  heads = {
    {"c", vim.dap.continue},
    {"b", vim.dap.toggle_breakpoint },
    {"n", vim.dap.step_over},
    {"s", vim.dap.step_into },
    {"o", vim.dap.step_out },
    {
      "a",
      function()
        if vim.dap.session() then vim.dap.restart() else vim.dap.run_last() end
      end
    },
    {"q", vim.dap.terminate, { exit = true }},
  },
})
