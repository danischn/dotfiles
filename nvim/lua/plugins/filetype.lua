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
      vim.keymap.set({ 'n', 'v', 'i' },'<F3>', function() require('knap').process_once() end)
      vim.keymap.set({ 'n', 'v', 'i' },'<F8>', function() require("knap").toggle_autopreviewing() end)
		end,
	},
}
