-- Define mode map (for active windows)
local mode_map = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  [""] = "V-BLOCK",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

function CurrentMode()
  local mode = vim.api.nvim_get_mode().mode
  return mode_map[mode] or "UNKNOWN"
end

function Cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") .. "/"
end

function Gitbranch()
  local branch = vim.fn.systemlist("git branch --show-current 2> /dev/null")[1]
  return branch and "|  " .. branch or ""
end

-- Active statusline (full details)
local active_statusline = table.concat({
  " %{%v:lua.CurrentMode()%} ",
  "| %#StatusLineCWD#%{%v:lua.Cwd()%}%*%f ",
  "%{%v:lua.Gitbranch()%} ",
  "%= ",
  "[%l:%c] ",
})

-- Inactive statusline (simplified)
local inactive_statusline = "%=%#Statement#%f%*%="

vim.opt.statusline = inactive_statusline
vim.wo.statusline = active_statusline

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.wo.statusline = active_statusline
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.wo.statusline = inactive_statusline
  end,
})
