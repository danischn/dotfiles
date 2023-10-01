return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local lsp = require("lsp-zero").preset({ manage_nvim_cmp = { set_sources = "recommended" } }) --More cmp sources

		lsp.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })

		lsp.on_attach(function(_, bufnr)
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gh", ":lua vim.lsp.buf.hover()<cr>", opts)
			vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
			vim.keymap.set("n", "gp", ":lua vim.diagnostic.open_float()<cr>", opts)
			vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<cr>", opts)
			vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<cr>", opts)
			vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<cr>", opts)
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>", opts)
			vim.keymap.set("n", "<leader>lw", ":lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
		end)

		--Lua server for nvim
		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

		--Python server
		require("lspconfig").pyright.setup({
			settings = {
				python = {
					analysis = {
						autoImportCompletions = true,
						typeCheckingMode = "off",
					},
				},
			},
		})

		--Markdown
		require("lspconfig").marksman.setup({})

		lsp.setup()

		--Setup CMP
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = {
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			},
		})

		vim.diagnostic.config({ virtual_text = false })
	end,
}
