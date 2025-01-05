-- https://github.com/tonsky/sublime-scheme-alabaster

vim.cmd("hi clear")
vim.g.colors_name = "iben"
vim.o.background = "light"

local fg = "#000000"
local bg = "#FAF2EB"
local def = "#325CC0"
local constant = "#8945B0"
local string = "#448C27"
local comment = "#999791"
local active = "#FFBC5D"
local pmenu_bg = "#E7E7E7"

local error = "#D13E23"
local warn = "#F4B371"
local hint = "#8EBEEC"
local info = "#88CC66"

local ansi = {
	black = "#000000",
	blue = "#325CC0",
	brightyellow = "#FFBC5D",
	cyan = "#0083b2",
	green = "#448c27",
	magenta = "#7A3E9D",
	red = "#AA3731",
	white = "#F7F7F7",
	yellow = "#CB9000",
}

local groups = {
	Normal = { fg = fg, bg = bg },
	NormalFloat = { link = "Normal" },
	Comment = { fg = comment },
	NonText = { fg = "#696969" },

	Constant = { fg = fg },
	String = { fg = string },
	Number = { link = "Constant" },
	Boolean = { link = "Constant" },
	Float = { link = "Constant" },

	Identifier = { fg = fg },
	Function = { fg = def },

	Statement = { fg = fg, bold = true },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = { fg = fg },
	Keyword = { link = "Statement" },
	Exception = { link = "Statement" },

	Question = { fg = fg },
	PreProc = { link = "Question" },
	Include = { link = "Question" },
	Define = { link = "Question" },
	Macro = { link = "Question" },
	PreCondit = { link = "Question" },

	Type = { fg = fg },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },

	Special = { fg = fg },
	SpecialKey = { link = "Special" },
	SpecialChar = { link = "Special" },
	Tag = { link = "Special" },
	Delimiter = { link = "Special" },
	SpecialComment = { link = "Special" },
	Debug = { link = "Special" },

	Underlined = { underline = true },

	Directory = { link = "SpecialKey" },

	Title = { fg = constant },

	IncSearch = { fg = fg, bg = active },
	Search = { link = "IncSearch" },
	CurSearch = { link = "IncSearch" },

	LineNr = { fg = "#7d7c7c" },
	CursorLineNr = { link = "Normal" },

	StatusLine = { fg = fg, bg = bg },
	StatusLineNC = { fg = fg, bg = bg },

	TabLine = { link = "Normal" },
	TabLineSel = { reverse = true },

	WinSeparator = { fg = fg },

	SignColumn = { link = "LineNr" },
	FoldColumn = { link = "SignColumn" },

	Conceal = { fg = "#b0b0b0" },
	SpellBad = { undercurl = 1, sp = ansi.red },
	SpellCap = { undercurl = 1, sp = ansi.blue },
	SpellLocal = { undercurl = 1, sp = ansi.cyan },
	SpellRare = { undercurl = 1, sp = ansi.magenta },

	Pmenu = { bg = pmenu_bg },
	PmenuSel = { bg = "#354c50" },
	PmenuSbar = { bg = "#212f31" },
	PmenuThumb = { bg = "#47666b" },

	WildMenu = { bg = "#999999" },
	Visual = { link = "CursorLine" },
	Folded = {},

	TermCursor = { link = "Cursor" },
	CursorLine = { bg = "#E6E4DF" },
	CursorColumn = { link = "CursorLine" },

	MoreMsg = { fg = ansi.green, bold = 1 },
	ErrorMsg = { fg = fg, bg = ansi.red },
	WarningMsg = { fg = "#e1ad4c" },

	Ignore = {},
	Error = { link = "ErrorMsg" },
	Todo = { bg = "#d0d058", fg = bg },

	MatchParen = { underline = 1, sp = active },

	-- Treesitter
	["@variable"] = { link = "Identifier" },
	["@variable.builtin"] = { link = "Type" },
	["@variable.parameter"] = { link = "Identifier" },
	["@variable.member"] = { link = "Identifier" },

	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Type" },
	["@constant.macro"] = { link = "Define" },

	["@module"] = { link = "Include" },
	["@module.builtin"] = { link = "Include" },
	["@label"] = { link = "Label" },

	["@string"] = { link = "String" },
	["@string.documentation"] = { link = "String" },
	["@string.regexp"] = { link = "String" },
	["@string.escape"] = { link = "SpecialChar" },
	["@string.special"] = { link = "SpecialChar" },
	["@string.special.symbol"] = { link = "Identifier" },
	["@string.special.path"] = { link = "Underlined" },
	["@string.special.url"] = { link = "Underlined" },

	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },

	["@boolean"] = { link = "Boolean" },
	["@number"] = { link = "Number" },
	["@number.float"] = { link = "Float" },

	["@type"] = { link = "Type" },
	["@type.builtin"] = { link = "Type" },
	["@type.qualifier"] = { link = "Type" },
	["@type.definition"] = { link = "Typedef" },

	["@attribute"] = { link = "PreProc" },
	["@property"] = { link = "Identifier" },

	["@function"] = { link = "Function" },
	["@function.builtin"] = { link = "Function" },
	["@function.call"] = { link = "Function" },
	["@function.macro"] = { link = "Function" },

	["@function.method"] = { link = "@function" },
	["@function.method.call"] = { link = "@function.call" },

	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },

	["@keyword"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Keyword" },
	["@keyword.operator"] = { link = "Keyword" },
	["@keyword.import"] = { link = "Keyword" },
	["@keyword.storage"] = { link = "Keyword" },
	["@keyword.repeat"] = { link = "Keyword" },
	["@keyword.return"] = { link = "Keyword" },
	["@keyword.debug"] = { link = "Keyword" },
	["@keyword.exception"] = { link = "Keyword" },
	["@keyword.conditional"] = { link = "Keyword" },
	["@keyword.conditional.ternary"] = { link = "Conditional" },
	["@keyword.directive"] = { link = "PreProc" },
	["@keyword.directive.define"] = { link = "PreProc" },

	["@punctutation"] = { link = "Delimiter" },
	["@punctutation.delimiter"] = { link = "Delimiter" },
	["@punctutation.bracket"] = { link = "Delimiter" },
	["@punctutation.special"] = { link = "Delimiter" },

	["@comment"] = { link = "Comment" },
	["@comment.documentation"] = { link = "Comment" },

	["@comment.warning"] = { link = "WarningMsg" },
	["@comment.error"] = { link = "Error" },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { link = "SpecialComment" },

	["@markup.strong"] = { bold = true },
	["@markup.emphasis"] = { italic = true },
	["@markup.underline"] = { underline = true },
	["@markup.strike"] = { strikethrough = true },

	["@markup.heading"] = { link = "Title" },
	["@markup.heading.gitcommit"] = { link = "@spell" },

	["@markup.quote"] = { link = "Comment" },
	["@markup.math"] = { link = "Special" },
	["@markup.environment"] = { link = "Macro" },

	["@markup.link"] = { link = "Underlined" },
	["@markup.link.label"] = { link = "SpecialChar" },
	["@markup.link.url"] = { link = "Keyword" },

	["@markup.raw"] = { link = "SpecialComment" },
	["@markup.raw.block"] = {},

	["@markup.list"] = { link = "Identifier" },
	["@markup.list.checked"] = { link = "Comment" },
	["@markup.list.unchecked"] = { link = "Identifier" },

	["@tag"] = { link = "Label" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@tag.attribute"] = { link = "Identifier" },

	["@diff.plus"] = { link = "DiffAdd" },
	["@diff.minus"] = { link = "DiffDelete" },
	["@diff.delta"] = { link = "DiffChange" },

	-- lsp
	DiagnosticError = { fg = error },
	DiagnosticWarn = { fg = warn },
	DiagnosticHint = { fg = hint },
	DiagnosticInfo = { fg = info },
	DiagnosticUnnecessary = { fg = fg, underline = true },
	DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
	DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
	DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
	DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },

	-- mini.files
	MiniFilesBorder = { link = "WinSeparator" }, -- border of regular windows.
	MiniFilesBorderModified = { link = "DiffChange" }, -- border of windows showing modified buffer.
	MiniFilesDirectory = { link = "SpecialKey" }, -- text and icon representing directory.
	MiniFilesFile = { link = "Identifier" }, -- text representing file.
	MiniFilesNormal = { link = "Normal" }, -- basic foreground/background highlighting.
	MiniFilesTitle = { link = "Comment" }, -- title of regular windows.
	MiniFilesTitleFocused = { link = "PreProc" }, -- title of focused window.
}

for name, val in pairs(groups) do
	vim.api.nvim_set_hl(0, name, val)
end
