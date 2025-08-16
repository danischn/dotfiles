vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

-- vim.dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = 'executable',
--   command = '/home/schnei/.local/share/nvim/mason/bin/OpenDebugAD7',
-- }

-- vim.dap.configurations.c = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopAtEntry = true,
--   },
-- }
