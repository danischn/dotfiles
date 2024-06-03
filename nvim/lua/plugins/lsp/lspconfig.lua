return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = "hrsh7th/cmp-nvim-lsp",
	config = function()
		local lspconfig = require("lspconfig")

		--Keymaps
		local opts = { noremap = true, silent = true }
		local on_attach = function()
			vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gp", ":lua vim.diagnostic.open_float()<cr>", opts)
			vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<cr>", opts)
			vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>", opts)
			vim.keymap.set("n", "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
			vim.keymap.set("n", "<leader>li", ":LspInfo<cr>", opts)
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
