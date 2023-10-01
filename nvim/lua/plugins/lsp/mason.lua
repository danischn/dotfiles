return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	config = function()
		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason_lspconfig.setup({
			ensure_installed = {
        "lua_ls",
        "pyright",
        "marksman",
      },
		})

		mason_tool_installer.setup({
			ensure_installed = {
        "prettier",
        "stylua",
        "black",
        "debugpy",
      },
		})
	end,
}
