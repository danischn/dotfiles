return {
	--Markdown Previewer
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		keys = { { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	--Markdown-flow
	{
		"jakewvincent/mkdnflow.nvim",
		ft = "markdown",
		opts = {
			links = {
				conceal = true,
			},
			to_do = {
				symbols = { " ", "-", "x" },
			},
		},
	},
}
