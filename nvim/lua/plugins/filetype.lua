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
	{
		"frabjous/knap",
		config = function()
			local gknapsettings = {
				delay = 500,
			}
			vim.g.knap_settings = gknapsettings
      vim.keymap.set({ 'n', 'v', 'i' },'<F5>', "<cmd>require('knap').process_once()<cr>")
		end,
	},
}
