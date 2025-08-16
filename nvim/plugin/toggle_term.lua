local m = {}
m.width = math.floor(vim.o.columns * 0.9)
m.height = math.floor(vim.o.lines * 0.9)
m.col = math.floor((vim.o.columns - m.width) / 2)
m.row = math.floor((vim.o.lines - m.height) / 2)
m.win_opts = {
  relative = 'editor',
  row = m.row,
  col = m.col,
  width = m.width,
  height = m.height,
  style = 'minimal',
  border = 'single'}
m.table = {}

function m.toggle_term()
  local tab = vim.fn.tabpagenr()
  m.table[tab] = m.table[tab] or {}
  if (not m.table[tab].buf or not vim.api.nvim_buf_is_valid(m.table[tab].buf)) then
    m.table[tab].buf = vim.api.nvim_create_buf(true, true)
  end

  if m.table[tab].win and vim.api.nvim_win_is_valid(m.table[tab].win) then
    vim.api.nvim_win_hide(m.table[tab].win)
  elseif vim.bo[m.table[tab].buf].buftype ~= "terminal" then
    m.table[tab].win = vim.api.nvim_open_win(m.table[tab].buf, true, m.win_opts)
    vim.cmd.terminal()
    vim.cmd.startinsert()
  else
    m.table[tab].win = vim.api.nvim_open_win(m.table[tab].buf, true, m.win_opts)
    vim.cmd.startinsert()
  end
end

vim.api.nvim_create_autocmd('TabClosed', {
  group = vim.api.nvim_create_augroup("ToggleTerm", {clear = true}),
  callback = function(args)
    local tab = tonumber(args.file)
    local termbuf = m.table[tab] and m.table[tab].buf
    if termbuf == nil then
      return 
    end
    if vim.api.nvim_buf_is_valid(termbuf) then
        vim.api.nvim_buf_delete(termbuf, { force = true })
    end
  end,
})

vim.keymap.set({"n", "t"}, "<C-space>", m.toggle_term)

