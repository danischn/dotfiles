-- Define the mode map outside the function to avoid redefining it every time
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

-- Cache the current mode
function CurrentMode()
  local mode = vim.api.nvim_get_mode().mode
  return mode_map[mode] or "UNKNOWN"
end

-- Simplify the Cwd function
function Cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") .. "/"
end

-- Optimize Gitbranch to avoid shelling out to `tr` and handle errors cleanly
function Gitbranch()
  local branch = vim.fn.systemlist("git branch --show-current 2> /dev/null")[1]
  return branch and "|  " .. branch or ""
end

-- Set the statusline
vim.opt.statusline = " %{%v:lua.CurrentMode()%} | %#StatusLineCWD#%{%v:lua.Cwd()%}%*%f %{%v:lua.Gitbranch()%} %= [%l:%c] "
