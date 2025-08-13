local function get_mode()
  local mode = vim.fn.toupper(vim.api.nvim_get_mode().mode)
  local text = "%#statuslinemode# " .. mode .. " %* "
  return text, #mode + 3
end

local function cwd()
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
  local text = "%#statuslinecwd#" .. cwd .. "%* "
  return text, #cwd + 1
end

local function git_branch()
  if vim.b.git_branch and vim.b.git_branch ~= "" then
    return "#" .. vim.b.git_branch, #vim.b.git_branch + 1
  end
  return "", 0
end

local function workspaces()
  local tabline = {}
  local currenttab = vim.api.nvim_get_current_tabpage()

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    table.insert(tabline, currenttab == tab and "%#tablinesel#" or "%#tabline#")
    table.insert(tabline, " " .. (vim.t[tab].tabtitle or vim.api.nvim_tabpage_get_number(tab)) .. " ")
  end

  return table.concat(tabline)
end

function Statusline_render()
  local left_len = 0
  local left = ""
  local segments = {get_mode, cwd, git_branch}
  for _, f in ipairs(segments) do
    local text, len = f()
    left_len = left_len + len
    left = left .. text
  end
  local center = workspaces()
  local right = string.rep(" ", left_len)
  return left .. "%=" .. center .. "%=" .. right
end

vim.opt.statusline = "%{%v:lua.Statusline_render()%}"

local function tab_rename()
  local function on_confirm(input)
    if not input then return end
      vim.t.tabtitle = input ~= "" and input or nil
    end
  vim.ui.input({prompt = "New tabname (empty for cwd): "}, on_confirm)
  vim.cmd.redrawtabline()
end
vim.keymap.set("n", "<leader>,", tab_rename)
