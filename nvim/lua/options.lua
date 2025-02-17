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
vim.opt.termguicolors = true -- must be enabled
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.cursorline = true -- highlight the current line
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.number = true -- set numbered lines
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor

vim.diagnostic.config({ virtual_text = true })


-- LSP:
vim.lsp.enable("luals")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
