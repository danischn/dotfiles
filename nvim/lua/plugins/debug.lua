return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set("n", "<leader>s", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<up>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<down>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<right>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<leader>b", function()
				require("dap").toggle_breakpoint()
			end)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
}
