local function is_open(file)
  local output = vim.fn.system("ps -C  zathura  -o args=")
  if output == "" then return end

  local tbl = vim.split(output, "\n")
  return vim.tbl_contains(tbl, "zathura " .. file)
end

local function needs_move(cid)
  return true
end


local function get_container_id(file, callback, attempts)
  if attempts == 0 then
    return -1
  end

  local jq = string.format(' .. | objects | select(.name == "%s") | .id ',  file)
  local command = string.format("swaymsg -t get_tree | tee nvim.log | jq '%s' ", jq)
  local result = vim.fn.system(command)
  if result == "" then
    vim.defer_fn(function() get_container_id(file, callback, attempts -1) end, 200)
    return -1
  end
  callback(result)
end

local function move_to_focused(file)
  get_container_id(file, function(id)
    if id == -1 then
      vim.api.nvim_echo({{' ERROR: Sway could not find file! ', "ErrorMsg"}}, false, {})
      return
    end

    if needs_move(id) then
      vim.fn.system(string.format('swaymsg "[con_id=%d]" move container to workspace "1:term"', id))
    end
  end, 5)
end

local function open_as_pdf(file)
  local readable = vim.fn.filereadable(file)
  if readable then
    vim.ui.open(file)
    return
  end

  vim.api.nvim_echo({{' ERROR: File doesnt exist! ', "ErrorMsg"}}, false, {})
end

vim.keymap.set("n", "<leader><cr>", function() move_to_focused("/home/schnei/documents/skole/master/hacking/eksamen.pdf") end)

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup("Typst", {clear = true}),
  pattern = "*.typ",
  callback = function(arg)
    vim.cmd("silent make")
    local pdf_file = vim.fn.fnamemodify(arg.match, ":s?typ?pdf?") 
    if not is_open(pdf_file) then
      open_as_pdf(pdf_file)
      move_to_focused(pdf_file)
    end
  end,
})
