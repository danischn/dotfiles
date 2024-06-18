return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = { "hrsh7th/cmp-nvim-lsp"},
	config = function()
		local lspconfig = require("lspconfig")
		-- stylua: ignore
		local on_attach = function()
			vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Hover" })
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go definition" })
      vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Go definition" })
			vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename variable" })
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature help" })
			vim.keymap.set( "n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add workspace folder" })
		end

		-- Hide ghost text
		vim.diagnostic.config({ virtual_text = false })

		-- Setup lsp completion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		--Python server
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					analysis = {
						autoImportCompletions = true,
						typeCheckingMode = "off",
					},
				},
			},
		})

		--Lua server
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		--Bash server
		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {},
		})
	end,
}
