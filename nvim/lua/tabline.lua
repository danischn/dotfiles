function Tabline_render()
  local line = {}
  local currenttab = vim.fn.tabpagenr()

  table.insert(line, "%=")
  for tab=1, vim.fn.tabpagenr("$") do
    local cwd = vim.fn.fnamemodify(vim.fn.getcwd(0, tab), ":~")
    table.insert(line, currenttab == tab and "%#TabLineSel#" or "%#TabLine#")
    table.insert(line, (vim.t[tab].tabTitle and vim.t[tab].tabTitle or cwd))
    table.insert(line, " ")
  end
  table.insert(line, "%#TabLineFill#")
  table.insert(line, "%=")

  return table.concat(line)
end

vim.opt.tabline = ""
vim.opt.statusline = "%{%v:lua.Tabline_render()%}"

local function tab_rename()
  local function on_confirm(input)
    if not input then return end
      vim.t.tabTitle = input ~= "" and input or nil
    end
  vim.ui.input({prompt = "New tabname (empty for cwd): "}, on_confirm)
  vim.cmd.redrawtabline()
end

vim.keymap.set("n", "<leader>,", tab_rename)
