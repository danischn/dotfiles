vim.cmd.colorscheme("iben")
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 0 -- hide command bar
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- overrides ignorecase if search pattern contains upper case characters
vim.opt.hlsearch = true -- highlights searchs
vim.opt.pumheight = 4 -- pop up menu height
vim.opt.showmode = false -- Dont need to see mode in command line
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.splitbelow = true -- force all horizonal splits to go under the current window
vim.opt.undofile = true
vim.opt.termguicolors = true -- must be enabled
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.number = true -- set numbered lines
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor
vim.opt.updatetime = 200 -- Write swapfile more often to disk, also user for cursorhold
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.laststatus = 3
vim.g.c_syntax_for_h = true

function Diagnostic_mark()
  return vim.diagnostic.is_enabled() and "%#String#%*" or "%#StatusLineText#%*"
end


vim.opt.statusline = table.concat({
  " %{toupper(mode())}",
  " | ",
  "%f",
  "%{FugitiveHead() !=# '' ? ' |  '.FugitiveHead() : ''} ",
  "%{%v:lua.Diagnostic_mark()%}",  -- Call function that returns highlighted string
  "%= ",
  "[%l:%c] ",
})
