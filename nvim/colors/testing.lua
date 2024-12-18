vim.cmd([[hi clear]])
vim.g.colors_name = "testing"
vim.o.background = "light"

local c = {
	background = "#FAF2EB",
	foreground = "#424242",
	black = "#000000",
	comment = "#B0BEC5",
	green = "#6B8651",
	yellow = "#A6873F",
	purple = "#6A1B9A",
	blue = "#2962FF",
	red = "#b63e36",
}

local groups = {
	Normal = { fg = c.black, bg = c.background },
	Comment = { fg = c.comment },

	Constant = { fg = c.purple },
	String = { fg = c.green },
	Character = { fg = c.purple },
	Number = { fg = c.purple },
	Boolean = { fg = c.purple },
	Float = { fg = c.purple },

	Identifier = { fg = c.yellow },
	Function = { fg = c.blue },

	Statement = { fg = c.black, bold = true },
	Conditional = { fg = c.black, bold = true },
	Repeat = { fg = c.black, bold = true },
	Label = { fg = c.black, bold = true },
	Operator = { fg = c.black },
	Keyword = { fg = c.black, bold = true },
	Exception = { fg = c.black, bold = true },

	PreProc = { fg = c.black, bold = true },
	Include = { fg = c.black, bold = true },
	Define = { fg = c.black, bold = true },
	Macro = { fg = c.black, bold = true },
	PreCondit = { fg = c.black, bold = true },

	Type = { fg = c.black },
	StorageClass = { fg = c.black },
	Structure = { fg = c.black },
	Typedef = { fg = c.black },

	Special = {},
	SpecialChar = {},
	Tag = { fg = c.black, underline = true },
	Delimiter = { fg = c.black },
	SpecialComment = {},
	Debug = {},

	Underlined = { fg = c.foreground, underline = true },

	Error = { fg = c.black, bg = c.red },
	Todo = {},

	Added = {},
	Changed = {},
	Removed = {},
}

for name, val in pairs(groups) do
	vim.api.nvim_set_hl(0, name, val)
end
