local function ws_rename()
  local function on_confirm(input)
    if not input then return end
      vim.t.tabtitle = input ~= "" and input or nil
    end
  vim.ui.input({prompt = "New tabname (empty for tabnr): "}, on_confirm)
  vim.cmd.redrawtabline()
end
vim.keymap.set("n", "<leader>,", ws_rename)

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
  return cwd
end

local function get_tabs()
  local function calculate_weight(tabs)
    local strip = vim.api.nvim_eval_statusline(tabs, {}).str
    local split = vim.split(strip, " " ,{trimempty = true})
    local left, right = 0, 0
    local center = math.floor(#split / 2)
    for i, v in ipairs(split) do
      local len = #v
      if i <= center then
        left = left + len
      elseif i > #split - center then
        right = right + len
      end
    end
    return left, right
  end
  local tabs = {}
  local current_tab = vim.api.nvim_get_current_tabpage()
  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    local t = current_tab == tab and "%#TabLineSel#" or "%#TabLine#"
    t = t .. (vim.t[tab].tabtitle or vim.api.nvim_tabpage_get_number(tab))
    t = t .. "%*"
    table.insert(tabs, t)
  end
  local result = table.concat(tabs, " ")
  local left, right = calculate_weight(result)
  local pad = string.rep(" ", math.abs(left - right))
  return (left > right) and (result .. pad) or (pad .. result)
end

function Tabline()
  local cwd = get_cwd()
  local right_pad = string.rep(" ", string.len(cwd))
  local segments = {
     "%#TabLine#",
    cwd,
    "%=",
    get_tabs(),
    "%=",
    right_pad
  }
  return table.concat(segments)
end

vim.opt.tabline = "%{%v:lua.Tabline()%}"
vim.opt.laststatus = 3
vim.opt.statusline = "  "
