return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	cmd = "FzfLua",
	keys = {
		{ "<leader>;", "<cmd>FzfLua files<cr>", desc = "Find file" },
		{ "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
		{ "<leader>h", "<cmd>FzfLua help_tags<cr>", desc = "Search: Helptags" },
		{ "<leader>k", "<cmd>FzfLua keymaps<cr>", desc = "Search: keymaps" },
	},
	config = function()
		require("fzf-lua").setup({
			--Global settings
			{ "default-title" },
			defaults = {
				file_icons = false,
				git_icons = false,
			},
			winopts = {
				border = "single",
				preview = {
					-- default = "bat",
					layout = "vertical",
					delay = 10,
				},
			},

			-- Settings for files
			files = {
				winopts = {
					height = 0.3,
					width = 0.5,
				},
				cwd_prompt = false,
				actions = { ["ctrl-g"] = false },
				fd_opts = [[--color=always --type f --hidden --follow --exclude .git]],
				previewer = false,
			},
		})

		--Test
		-- vim.keymap.set("n", "<C-f>", function()
		-- 	local fzf_lua = require("fzf-lua")
		-- 	local exclude_dirs = {
		-- 		"Library",
		-- 		"Music",
		-- 		"Movies",
		-- 		"Public",
		-- 		"Desktop",
		-- 		"Applications",
		-- 		"Pictures",
		-- 		"automatic_backups",
		-- 		".cache",
		-- 		".local",
		-- 		".m2",
		-- 		".idlerc",
		-- 		".Trash",
		-- 		".Applications",
		-- 		".ssh",
		-- 		".vscode",
		-- 		".config",
		-- 		".DS_Store",
		-- 		".npm",
		-- 		".git",
		-- 		".matplotlib",
		-- 		".cups",
		-- 		".cargo",
		-- 		".swiftpm",
		-- 		".terminfo",
		-- 	}
		--
		-- 	local fd_command = {
		-- 		"fd",
		-- 		"--hidden",
		-- 		"--follow",
		-- 		"--color=always",
		-- 		"--base-directory=" .. os.getenv("HOME"),
		-- 	}
		--
		-- 	for i = 1, #exclude_dirs do
		-- 		table.insert(fd_command, "--exclude " .. exclude_dirs[i])
		-- 	end
		--
		-- 	local opts = {
		-- 		winopts = {
		-- 			height = 0.3,
		-- 			width = 0.5,
		-- 		},
		-- 		actions = {
		-- 			["default"] = function(selected)
		-- 				local path = os.getenv("HOME") .. "/" .. selected[1]
		-- 				local file_obj = vim.system({ "file", "--mime-type", "-b", path }, { text = true }):wait()
		-- 				local filetype = vim.fn.substitute(file_obj.stdout, "\n", "", "g")
		--
		-- 				if filetype == "inode/directory" then
		-- 					print("Changed dir to " .. selected[1])
		-- 					vim.cmd("cd " .. path)
		-- 					vim.cmd("intro")
		-- 				elseif
		-- 					string.match(filetype, "^text/")
		-- 					or filetype == "application/json"
		-- 					or filetype == "inode/x-empty"
		-- 				then
		-- 					vim.cmd("cd " .. vim.fn.fnamemodify(path, ":h"))
		-- 					vim.cmd("edit " .. path)
		-- 				else
		-- 					vim.system({ "open", path })
		-- 				end
		-- 			end,
		-- 		},
		-- 	}
		--
		-- 	fzf_lua.fzf_exec(table.concat(fd_command, " "), opts)
		-- end)
	end,
}
