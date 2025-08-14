local m = {}

m.state = {
    focus_on = false,
    focus_buf = nil,
    bg_buf = vim.api.nvim_create_buf(false, true),
    bg_win = nil,
    focus_win = nil,
}

m.bg_buf_opts = {
	relative = 'editor',
	width = vim.o.columns,
	height = vim.o.lines,
	row = 0,
	col = 0,
	style = 'minimal',
  border = "none",
	zindex = 40,
}

m.focus_buf_opts = {
		relative = 'editor',
		width = 100,
		height = vim.o.lines,
		row = 0,
		col = (vim.o.columns - 100) / 2,
		style = 'minimal',
    border = "none",
		zindex = 50,
}

function m.openFocus()
  m.state.focus_buf = vim.api.nvim_get_current_buf()
  m.state.focus_on = true

	m.state.bg_win = vim.api.nvim_open_win(m.state.bg_buf, false, m.bg_buf_opts)
	m.state.focus_win = vim.api.nvim_open_win(m.state.focus_buf, true, m.focus_buf_opts)

	vim.api.nvim_set_option_value('winhighlight', 'NormalFloat:FocusBg', {scope = "local", win = m.state.bg_win})
	vim.api.nvim_set_option_value('winbar', '', {scope = "local", win = m.state.focus_win})
  vim.wo.signcolumn = "yes:1"
end

function m.closeFocus()
  m.state.focus_on = false
  vim.api.nvim_win_close(m.state.focus_win, true)
  vim.api.nvim_win_close(m.state.bg_win, true)
end


function m.toggleFocus()
  if m.state.focus_on then
    m.closeFocus()
  else
    m.openFocus()
  end
end

function m.setup()
	vim.keymap.set("n", "<leader>z", function() m.toggleFocus() end)
end

m.setup()
