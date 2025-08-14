local function get_mode()
  local mode = vim.fn.toupper(vim.api.nvim_get_mode().mode)
  local text = "  %#StatusLineMode# " .. mode .. " %* "
  return text, #mode + 5
end

local function get_cwd()
  local function truncate(dir)
    local path, _ = string.gsub(dir, "~", "")
    local split = vim.split(path , "/", { trimempty = true })
    local max_path_len = 3
    if #split <= max_path_len then
      return dir
    else
      return ".../" .. table.concat(split, "/", #split - 2)
    end
  end
  local cwd = truncate(vim.fn.fnamemodify(vim.fn.getcwd(0, 0), ':~'))
  local text = "%#StatusLineCwd#" .. cwd .. "%* "
  return text, #cwd + 1
end

local function workspaces()
  local tabline = {}
  local currenttab = vim.api.nvim_get_current_tabpage()

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    table.insert(tabline, currenttab == tab and "%#TabLineSel#" or "%#TabLine#")
    table.insert(tabline, " " .. (vim.t[tab].tabtitle or vim.api.nvim_tabpage_get_number(tab)) .. " ")
  end

  return table.concat(tabline)
end

local function diagnostics()
    local num_warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local num_err = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    return "E:" .. num_err .. " W:" .. num_warn
end

function Prog_bar()
  local result = {
    "%#StatusLine#",
    " ",
    "%f",
    "%m",
    " ",
    diagnostics(),
    " ",
    "%=",
    " ",
    "%l:%c",
    "%*",
    " ",
  }
  return table.concat(result)
end

vim.opt.statusline = "%{%v:lua.Prog_bar()%}"

local function ws_rename()
  local function on_confirm(input)
    if not input then return end
      vim.t.tabtitle = input ~= "" and input or nil
    end
  vim.ui.input({prompt = "New tabname (empty for cwd): "}, on_confirm)
  vim.cmd.redrawtabline()
end
vim.keymap.set("n", "<leader>,", ws_rename)

function Workspaces()
  local tabline = {}
  local currenttab = vim.api.nvim_get_current_tabpage()

  table.insert(tabline, "%#TabLine#%=")
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    table.insert(tabline, currenttab == tab and "%#TabLineSel#" or "%#TabLine#")
    table.insert(tabline, " " .. (vim.t[tab].tabtitle or vim.api.nvim_tabpage_get_number(tab)) .. " ")
  end
  table.insert(tabline, "%=")

  return table.concat(tabline)
end

vim.opt.tabline = "%{%v:lua.Workspaces()%}"
