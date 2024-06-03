return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = "hrsh7th/cmp-nvim-lsp",
	config = function()
		local lspconfig = require("lspconfig")

		--Keymaps
		local opts = { noremap = true, silent = true }
		local on_attach = function()
      opts.desc = "Hover"
			vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<cr>", opts)

      opts.desc = "Go definition"
			vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)

      opts.desc = "See diagnostic"
			vim.keymap.set("n", "gp", ":lua vim.diagnostic.open_float()<cr>", opts)

      opts.desc = "Rename variable"
			vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<cr>", opts)

      opts.desc = "Signature_help"
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)

      opts.desc = "Add workspace folder"
			vim.keymap.set("n", "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
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
