vim.cmd([[hi clear]])
vim.g.colors_name = "iben"
vim.o.background = "light"

local c = {
	foreground = "#37474F",
	background = "#FAF2EB",
	highlight = "#FAFAFA",
	critical = "#FF6F00",
	salient = "#673AB7",
	default = "#000000",
	popout = "#FFAB91",
	subtle = "#ECEFF1",
	faded = "#B0BEC5",
	cursorline = "#E6E4DF",
}

local hl_groups = {
	Normal = { fg = c.foreground, bg = c.background }, -- Default text color and background
	CursorLine = { bg = c.cursorline }, -- Background color for the line where the cursor is located

	Comment = { fg = c.faded }, -- any comment
	Constant = { fg = c.salient }, -- any constant
	String = { fg = c.salient }, -- a string constant: "this is a string"
	Character = { fg = c.salient }, -- a character constant: 'c', '\n'
	Number = { fg = c.salient }, -- a number constant: 234, 0xff
	Boolean = { fg = c.salient }, -- a boolean constant: TRUE, false
	Float = { fg = c.salient }, -- a floating point constant: 2.3e10
	Operator = { fg = c.default }, -- "sizeof", "+", "*", etc.

	Identifier = { fg = c.default, bold = true }, --	any variable name
	Function = { fg = c.default, bold = true }, -- function name (also: methods for classes)
	["@property"] = { fg = c.default, bold = false },
	["@variable"] = { fg = c.default, bold = true },

	Keyword = { fg = c.salient }, -- any keyword
	Statement = { link = "Keyword" }, -- any statement
	Conditional = { link = "Keyword" }, -- if, then, else, endif, switch, etc.
	Repeat = { link = "Keyword" }, -- for, do, while, etc.
	Label = { link = "Keyword" }, -- case, default, etc.
	Exception = { link = "Keyword" }, -- try, catch, throw

	Type = { fg = c.salient }, -- a data type: int, long, char, etc.
	StorageClass = { link = "Type" }, -- a storage class: static, register, volatile, etc.
	Structure = { link = "Type" }, -- structure-related keywords: struct, union, enum, etc.
	Typedef = { link = "Type" }, -- a typedef: defining a new name for a type

	MatchParen = { fg = c.critical, underline = true },
}

for name, val in pairs(hl_groups) do
	vim.api.nvim_set_hl(0, name, val)
end
