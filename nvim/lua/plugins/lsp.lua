return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		vim.diagnostic.config({ virtual_text = false })

		local lsp = require("lsp-zero").preset({ manage_nvim_cmp = { set_sources = "recommended" } }) --More cmp sources

		lsp.ensure_installed({ "pyright", "lua_ls", "marksman" }) --Languages

		lsp.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })

		lsp.on_attach(function(_, bufnr)
      --My lsp keymaps
			vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = bufnr, remap = false, desc = "Hover" })
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = bufnr, remap = false, desc = "Go definition"})
			vim.keymap.set("n", "gp", "<cmd>lua vim.diagnostic.open_float()<cr>", { buffer = bufnr, remap = false, desc = "Go Problem" })
			vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = bufnr, remap = false, desc = "Next Diagnostic"})
			vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = bufnr, remap = false, desc = "Prev Diagnostic" })
			vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", { buffer = bufnr, remap = false, desc = "Lsp Rename" })
			vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = bufnr, remap = false, desc = "Signature Help"})
      vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr, remap = false, desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { buffer = bufnr, remap = false, desc = "Add Workspace" })
			vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", { buffer = bufnr, remap = false, desc = "Format" })
		end)

		--Lua server for nvim
		require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

		--Python server
		require("lspconfig").pyright.setup({
      settings = {
        python = {
          analysis = { autoImportCompletions = true, typeCheckingMode = "off" },
        },
      },
    })

    --Markdown
    require("lspconfig").marksman.setup{}


		lsp.setup()

		--Cmp settings
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = {
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
			},
		})
	end,
}
