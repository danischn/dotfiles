return {
	"mhartington/formatter.nvim",
  event = { "BufNewFile", "BufRead" },
  config = function()
    require("formatter").setup({
      filetype = {
        lua = { require("formatter.filetypes.lua").stylua },
        python = { require("formatter.filetypes.python").black },
			},
		})
	end,
}
