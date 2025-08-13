local get_ai_buffer = function()
  local buf
  if vim.fn.bufexists("[AI]") == 1 then
    buf = vim.fn.bufnr("[AI]")
  else
    buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "[AI]")
  end
  return buf
end

local write_ai_buffer = function(tbl)
  local buf = get_ai_buffer()
  table.insert(tbl, 1, "## AI") -- This prepends

  table.insert(tbl, "") -- This prepends
  table.insert(tbl, "## Input") -- This appends
  vim.api.nvim_buf_set_lines(buf, -1, -1, true, tbl)
end

local parse_gpt_reply = function(json_tbl)
  local output = json_tbl.output[1].content[1].text
  return vim.split(output, "\n")
end

local set_buffer_options = function()
  -- TODO
  -- Conceallevel
  -- Wrap Linebreak
  -- Filetype=markdown
  -- Gj and Gk keybinds
  -- On enter it 
end

local highlight_schnei = function()
  local ns = vim.api.nvim_create_namespace("Schnei")
  local buf = get_ai_buffer()
  local last_line = vim.api.nvim_buf_get_lines(buf, -2, -1, true)[1]
  local last_line_index = vim.api.nvim_buf_line_count(buf) - 1 -- 0 based
  print(last_line_index)
  print(vim.inspect(last_line))
  local extmark_opts = {
    end_row = last_line_index,
    end_col = #last_line,
    hl_group = "DiffText",
    end_right_gravity = true,
    hl_eol = true
  }
  local gpt_mark = vim.api.nvim_buf_set_extmark(buf, ns, last_line_index, 0, extmark_opts)
end

local extract_input = function()
  local buf = get_ai_buffer()
  local buffer = vim.api.nvim_buf_get_lines(buf, 0, -1, true)

  for i,line in ipairs(buffer)do
    if line == "## Input" then
      local input = vim.api.nvim_buf_get_lines(buf, i, -1, true)
      return table.concat(input, "\n")
    end
  end
  return nil
end

local ask_gpt = function()
  local on_exit = vim.schedule_wrap(function(obj)
    local json = vim.json.decode(obj.stdout)
    write_ai_buffer(parse_gpt_reply(json))
  end)

  local key = os.getenv("OPENAI_API_KEY")
  local command = { "curl",
  "https://api.openai.com/v1/responses",
  "-H",
  "Content-Type: application/json",
  "-H",
  "Authorization: Bearer " .. key,
  "-d"}
  local payload = { model = "gpt-4.1", input = extract_input()}

  if not payload.input then
    vim.notify("Could not parse AI Buffer", vim.log.levels.ERROR)
    return
  end

  table.insert(command, vim.json.encode(payload))
  vim.system(command, {text = true}, on_exit)
end

ask_gpt()
