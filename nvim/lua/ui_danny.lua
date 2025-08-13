M = M or {}
-- Todo
-- Filter the history. Dont need write and yank in the message history
-- Highlight the Messages
-- Make the pop-notify be able to handle lines that are longer than 1
-- Show the message buffer immediately after printing a kind of message. For example using vim.print(vim.inspect(something)))
--        And dont show it it's already visible
-- Show search count with virtual text
-- How to deal with grep and make?

local function find_and_delete_messages_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match("%[MESSAGES%]") then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

function M.setup()
  find_and_delete_messages_buf()

  M.buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(M.buf, "[MESSAGES]")

  M.ns = vim.api.nvim_create_namespace('schnei/messages')
  M.history = M.history or {}

  M.mess_row = 0
  M.active_popups = 0

  vim.keymap.set({ "n", "v" }, ":", "q:i", { silent = true })
  return M
end

function M.clean()
  M.history = {}
end

function M.update_history(lines)
  local time = os.date("%H:%M:%S") -- 14:35:09
  M.history = vim.iter({ time, lines, M.history }):flatten():totable()
  vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, M.history)
end

function M.pop_notify(content, hl_id)
  local message_width = vim.fn.strdisplaywidth(content)
  local buf = vim.api.nvim_create_buf(false, true)
  local ext_ns = vim.api.nvim_create_namespace("schnei/test")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {content})

  local win = vim.api.nvim_open_win(buf, false, {
    relative = 'editor',
    row = (vim.o.lines - 2) - M.mess_row,
    col= vim.o.columns,
    width = message_width,
    height = 1,
    style = "minimal",
    border = "none"
  })

  vim.api.nvim_buf_set_extmark(buf, ext_ns, 0, 0, {
    end_row = 0,
    end_col = message_width,
    hl_group = hl_id
  })


  M.mess_row = M.mess_row + 1
  M.active_popups = M.active_popups + 1

  vim.defer_fn(function()
    vim.api.nvim_win_close(win, true)
    M.active_popups = M.active_popups - 1
    if M.active_popups == 0 then M.mess_row = 0 end
  end, 5000)
end

function M.win_notify(content)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    row = 10,
    col= (vim.o.columns / 2) - 25,
    width = 50,
    height = #content,
    style = "minimal",
    border = "single",
    title = "Message",
    title_pos = "center"
  })
end

function M.notify_handler(kind, lines, hl_id)
  if #lines == 1 then 
    M.pop_notify(lines[1], hl_id)
  else
    M.win_notify(lines)
  end
end

function M.handler(kind, content)
  if #content > 1 then
    M.update_history("Content larger than 1")
    M.pop_notify    ("Content larger than 1")
  end

  local _, text_chunk, hl_id = unpack(content[1])
  text_chunk = kind .. "\n" .. text_chunk
  local lines = vim.split(text_chunk, "\n")
  M.update_history(lines)
  M.notify_handler(kind, lines, hl_id)
end


function M.attach()
  vim.ui_attach(M.ns, {ext_messages=true}, function(event, ...)
    if event == 'msg_show' then
      local kind, content, _ = ...
      vim.schedule(function() M.handler(kind, content) end)
    end
  end)
end

function M.detach()
  vim.ui_detach(M.ns)
end

require('vim._extui').enable({})
-- M.setup()
-- M.detach()
