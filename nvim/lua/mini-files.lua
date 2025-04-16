---@diagnostic disable: undefined-global

require("mini.files").setup({
  mappings = {
    synchronize = "<cr>",
    go_in_plus = "l",
  },
  windows = {
    max_numer = 3,
    width_focus = 30,
    width_nofocus = 30,
  },
})


local set_cwd = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  print(path)
  if path == nil then return vim.notify('Cursor is not on valid entry') end
  vim.fn.chdir(path)
  MiniFiles.close()
end



vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set("n", " ", set_cwd,   { buffer = b, desc = "Set cwd" })
  end,
})

vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)
