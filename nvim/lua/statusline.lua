function CurrentMode()
    local mode_map = {
        n = "NORMAL",
        i = "INSERT",
        v = "VISUAL",
        V = "V-LINE",
        [""] = "V-BLOCK",
        c = "COMMAND",
        R = "REPLACE",
        t = "TERMINAL",
    }
    local mode = vim.api.nvim_get_mode().mode
    return mode_map[mode]
end

function Cwd()
  local cwd = vim.fn.getcwd()
  return vim.fn.fnamemodify(cwd, ":~") .. "/"
end

function Gitbranch()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    if vim.v.shell_error ~= 0 or branch == "" then
        return ""
    end
    return "|  " .. branch
end

vim.opt.statusline = " %{v:lua.CurrentMode()} | %#StatusLineCWD#%{v:lua.Cwd()}%*%f %{v:lua.Gitbranch()} %= [%l:%c] "
