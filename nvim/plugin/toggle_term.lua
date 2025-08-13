local m = {}

function m.toggle_term()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)
    local win_opts = {
        relative = 'editor',
        row = row,
        col = col,
        width = width,
        height = height,
        style = 'minimal',
        border = 'single'}

  if not m.buf then
    m.buf = vim.api.nvim_create_buf(true, true)
  elseif not vim.api.nvim_buf_is_valid(m.buf) then
    m.buf = vim.api.nvim_create_buf(true, true)
  end

  if m.win and vim.api.nvim_win_is_valid(m.win) then
    vim.api.nvim_win_hide(m.win)
  elseif vim.bo[m.buf].buftype ~= "terminal" then
    m.win = vim.api.nvim_open_win(m.buf, true, win_opts)
    vim.cmd.terminal()
    vim.cmd.startinsert()
  else
    m.win = vim.api.nvim_open_win(m.buf, true, win_opts)
    vim.cmd.startinsert()
  end
end

vim.keymap.set({"n", "t"}, "<C-space>", m.toggle_term)
