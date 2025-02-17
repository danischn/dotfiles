require("conform").setup({
  formatters_by_ft = {
    python = { "black" },
    lua = { "stylua" },
    markdown = { "prettier" },
    c = { "clang-format" },
  },
})
vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<cr>")
