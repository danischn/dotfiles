vim.keymap.set("i", "<C-v>", "<esc>ysiw\"li$<esc>wwa", {remap = true, buffer = true})

vim.bo.makeprg = vim.fn.expand("%:p")
