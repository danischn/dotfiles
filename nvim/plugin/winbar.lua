local function filename()
  local name = vim.api.nvim_buf_get_name(0)
  local hl_file = "%#StatusLineCWD#"
  local fname = vim.fn.fnamemodify(name, ":~:.")
  local file = vim.fn.fnamemodify(name, ":t")
  local parent = vim.fn.fnamemodify(fname, ":h")
  parent = (parent == "." and "" or (parent .. "/"))
  return parent .. hl_file .. file .. "%*"
end

local function diagnostics_enabled()
  local icon = ""
  local hl = vim.diagnostic.is_enabled({bufnr = 0}) and "%#DiagnosticEnabled#" or "%#DiagnosticDisabled#"
  local hl_end = "%*"
  return hl .. icon .. hl_end
end

local function diagnostics()
    local num_warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local num_err = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    return "E:" .. num_err .. " W:" .. num_warn
end

local function search_count()
  if vim.v.hlsearch == 0 then
    return ""
  end

  if vim.api.nvim_get_current_win()  ~= tonumber(vim.g.actual_curwin) then
    return ""
  end

  local result = vim.fn.searchcount()
  return result.current .. "/" .. result.total
end

local function prog_bar()
  local segments = {
    filename(),
    "%m",
    " ",
    search_count(),
    "%=",
    diagnostics_enabled(),
    " ",
    diagnostics()
  }
  return table.concat(segments)
end


local function writing_bar()
  local segments = {
    "%t",
    " ",
    "Words: " .. vim.fn.wordcount().words,
    search_count(),
  }
  return table.concat(segments)
end

local function quickfix_bar()
  local segments = {
    "[QUICKFIX]",
    " ",
    "Entries: ",
    #vim.fn.getqflist()
  }
  return table.concat(segments)
end

local function help_bar()
  local segments = {
    "[HELP]",
    " ",
    "%f",
    search_count()
  }
  return table.concat(segments)
end

function Winbar()
  local btype = vim.bo.buftype
  local ftype = vim.bo.filetype
  local writing_types = {
    text = true,
    markdown = true,
  }
  if btype == "help" then
    return help_bar()
  elseif btype == "quickfix" then
    return quickfix_bar()
  elseif writing_types[ftype] then
    return writing_bar()
  elseif vim.api.nvim_buf_get_name(0) == ""  then
    return "[Untitled]"
  else
    return prog_bar()
  end
end

vim.opt.winbar = "%{%v:lua.Winbar()%}"
