require("fzf-lua").setup({
  { "default-title" },
  defaults = {
    file_icons = false,
    git_icons = false,
  },
  winopts = {
    border = "single",
    preview = {
      layout = "vertical",
      delay = 10,
    },
  },
  -- Settings for files
  files = {
    winopts = {
      height = 0.3,
      width = 0.5,
    },
    cwd_prompt = false,
    actions = { ["ctrl-g"] = false },
    fd_opts = [[--color=always --type f --hidden --follow]],
    previewer = false,
  },
})

vim.keymap.set("n", "<leader>;", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>FzfLua keymaps<cr>")
