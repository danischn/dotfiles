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
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~") .. "/"
  local parts = vim.split(cwd, "/")

  if #parts > 4 then
    return table.concat({ "...", parts[#parts - 2], parts[#parts - 1], "" }, "/")
  end
  return cwd
end

function Gitbranch()
  local branch = vim.fn.systemlist("git branch --show-current 2> /dev/null")[1]
  return branch or ""
end

-- Active statusline (full details)
local active_statusline = table.concat({
  " %{%v:lua.CurrentMode()%}",              -- Mode 
  " | ",                                    -- Separator
  -- "%= ",                                    -- Right align
  -- "%#StatusLineCWD#%{%v:lua.Cwd()%}%*",     -- StatusLineCWD
  "%f",                                     -- File
  " | ",                                    -- Separator
  " %{%v:lua.Gitbranch()%} ",              -- Branch
  "%= ",                                    -- Right align
  "[%l:%c] ",                               -- Linenr and column
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
