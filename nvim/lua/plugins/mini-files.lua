return {
  "echasnovski/mini.files",
  version = false,
  keys = { { "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Explorer" } },
  event = "VimEnter",
  opts = {
    mappings = { go_in_plus = "l", synchronize = "<cr>" },
    windows = { max_number = 3, width_focus = 28, width_nofocus = 28 },
    options = { permanent_delete = false },
  },
}
