return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			direction = "vertical",
			size = 60,
		})
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
    vim.keymap.set("n", "<leader><cr>", function ()
      vim.cmd("wa")
      vim.cmd("TermExec cmd='py %'")
    end)
	end,
}
