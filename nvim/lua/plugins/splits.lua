return {
	"mrjones2014/smart-splits.nvim",
	config = function()
    require("smart-splits").setup({})
    -- Moving between splits
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- Resizing
		vim.keymap.set("n", "<M-a>", require("smart-splits").resize_left)
		vim.keymap.set("n", "<M-s>", require("smart-splits").resize_down)
		vim.keymap.set("n", "<M-d>", require("smart-splits").resize_up)
		vim.keymap.set("n", "<M-f>", require("smart-splits").resize_right)
	end,
}

