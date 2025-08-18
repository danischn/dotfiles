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

vim.keymap.set("n", "<leader>e", function() MiniFiles.open(nil, false) end)
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), false) end)

local function split_file_vertically()
  local data = MiniFiles.get_fs_entry()
  local file = data.path
  if data.fs_type ~= "file" then
    return
  else
    vim.cmd.vsplit(file)
    MiniFiles.close()
  end
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set("n", '<C-v>', split_file_vertically, {buffer = buf_id})
  end,
})
