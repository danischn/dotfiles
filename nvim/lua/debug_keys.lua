local floating_win = nil

local function open_floating_window()
  local buf = vim.api.nvim_create_buf(false, true)

  local win_width = vim.api.nvim_win_get_width(0)
  local float_width = 15

  local col_pos = win_width - float_width

  floating_win = vim.api.nvim_open_win(buf, false, {
    relative = "win",
    width = float_width,
    height = 8,
    row = 0,
    col = col_pos,
    border = "single",
    style = "minimal",
  })

  vim.api.nvim_buf_set_lines(
    buf,
    0,
    -1,
    false,
    {
      "===KEYMAPS===",
      "<> = <leader>",
      " = Continue",
      " = Step out",
      " = Step into",
      " = Step over",
    }
  )
end

vim.api.nvim_create_user_command("DebugKeys", open_floating_window, {})

local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

local widgets = require("dap.ui.widgets")
local my_sidebar = widgets.sidebar(widgets.scopes)

-- Open the floating window when the debug adapter starts
dap.listeners.before["event_initialized"]["debug_keys"] = function()
  open_floating_window()
end

-- Optionally, you can close the window when the debug session ends
dap.listeners.before["event_terminated"]["close_debug_keys"] = function()
  vim.api.nvim_win_close(floating_win, false)
end


-- stylua: ignore
vim.keymap.set('n', '<right>', function() require('dap').continue() end)
vim.keymap.set("n", "<left>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<down>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<up>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>di", function()
  my_sidebar.open()
end)
