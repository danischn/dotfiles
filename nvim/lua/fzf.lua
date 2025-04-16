require("fzf-lua").setup({
  { "default-title" },
  defaults = {
    file_icons = false,
    git_icons = false,
  },
  winopts = {
    border = "single",
    preview = {
      layout = "horizontal",
      delay = 10,
    },
  },
  -- Settings for files
  files = {
    winopts = {
      height = 0.3,
      width = 0.5,
    },
    fd_opts = [[--color=always --type f --follow --exclude .git]],
    previewer = false,
  },

  manpages = {
    winopts = {
      height = 0.3,
      width = 0.5,
    },
    previewer = false,
  },

  helptags = {
    winopts = {
      height = 0.3,
      width = 0.7,
    },
    previewer = false,
  }


})

vim.keymap.set("n", "<leader>;", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua help_tags<cr>")
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua manpages<cr>")

vim.keymap.set({ "i" }, "<C-x><C-f>",
  function()
    require("fzf-lua").complete_file({
      cmd = "rg --files",
      winopts = {
        height = 0.3,
        width = 0.5,
        preview = { hidden = true } ,
      }
    })
  end, { silent = true, desc = "Fuzzy complete file" })
