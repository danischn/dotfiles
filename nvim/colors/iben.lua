vim.cmd([[hi clear]])
vim.g.colors_name = "iben"
vim.o.background = "light"

local colors = {
	foreground = "#000000",
	background = "#FAF2EB",
	highlight = "#FAFAFA",
	critical = "#FF6F00",
	popout = "#FFAB91",
	strong = { fg = "#000000", bold = true },
	default = "#000000",
	salient = "#673AB7",
	subtle = "#ECEFF1",
	faded = "#B0BEC5",
	search = "#FFFF00",
}

local hl_groups = {
	-- General Appearance
	Normal = { fg = colors.foreground, bg = colors.background },
	NormalFloat = { link = "Normal" },
	CursorLine = { bg = colors.subtle },
	CursorColumn = { link = "CursorLine" },
	ColorColumn = { bg = colors.highlight },
	TabLine = { link = "Normal" },
	TabLineSel = { reverse = true },
	StatusLine = { fg = colors.foreground, bg = colors.highlight, bold = true },
	StatusLineNC = { fg = colors.foreground, bg = colors.highlight },

	-- Line Numbering
	LineNr = { fg = colors.faded },
	CursorLineNr = { link = "Normal" },
	SignColumn = { link = "LineNr" },
	FoldColumn = { link = "SignColumn" },

	-- Menus and Selection
	Pmenu = { fg = colors.foreground, bg = colors.highlight },
	PmenuSel = { fg = colors.foreground, bg = colors.faded },
	PmenuSbar = { bg = colors.foreground },
	PmenuThumb = { link = "PmenuSbar" },
	WildMenu = { bg = colors.highlight },

	-- Search and Matching
	IncSearch = { fg = colors.default, bg = colors.search },
	Search = { link = "IncSearch" },
	CurSearch = { link = "IncSearch" },
	MatchParen = { fg = colors.critical, underline = true },

	-- Diagnostic & Messaging
	Question = { fg = colors.foreground, bold = true },
	MoreMsg = { fg = colors.salient },
	ModeMsg = { fg = colors.salient },
	ErrorMsg = { fg = colors.background, bg = colors.critical },
	WarningMsg = { fg = colors.background, bg = colors.critical },

	-- Spell Checks
	SpellBad = { fg = colors.foreground, undercurl = true },
	SpellCap = { link = "SpellBad" },
	SpellLocal = { link = "SpellBad" },
	SpellRare = { link = "SpellBad" },

	-- Text Highlights
	Comment = { fg = colors.faded },
	Constant = { fg = colors.salient },
	String = { fg = colors.popout },
	Identifier = { fg = colors.default },
	Delimiter = { link = "Identifier" },
	Statement = { fg = colors.salient },
	Function = colors.strong,
	Operator = { link = "Identifier" },
	PreProc = { link = "Question" },
	Type = { fg = colors.default },
	Special = { link = "SpecialKey" },
	Underlined = { underline = true },
	Ignore = { fg = colors.background },
	Error = { link = "ErrorMsg" },
	Todo = { fg = colors.salient },

	-- Miscellaneous
	SpecialKey = { fg = colors.foreground },
	Directory = { link = "SpecialKey" },
	NonText = { fg = colors.faded },
	Folded = {},
	Cursor = { bg = colors.faded },
	TermCursor = { link = "Cursor" },
	Visual = { bg = colors.faded },
	DiffAdd = { fg = colors.foreground, bg = colors.salient },
	DiffChange = { fg = colors.foreground, bg = colors.popout },
	DiffDelete = { fg = colors.foreground, bg = colors.critical },

	-- Plugins

	-- Treesitter
	["@variable"] = { link = "Identifier" },
	["@constant"] = { link = "Constant" },
	["@module"] = { link = "Include" },
	["@module.builtin"] = { link = "Include" },
	["@label"] = { link = "Label" },
	["@string"] = { link = "String" },
	["@character"] = { link = "Character" },
	["@character.special"] = { link = "SpecialChar" },
	["@boolean"] = { link = "Boolean" },
	["@number"] = { link = "Number" },
	["@number.float"] = { link = "Float" },
	["@type"] = { link = "Type" },
	["@type.builtin"] = { link = "Type" },
	["@attribute"] = { link = "PreProc" },
	["@property"] = { link = "Identifier" },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { link = "Function" },
	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },
	["@keyword"] = { link = "Keyword" },
	["@punctutation.delimiter"] = { link = "Delimiter" },
	["@punctutation.bracket"] = { link = "Delimiter" },
	["@punctutation.special"] = { link = "Delimiter" },
	["@comment"] = { link = "Comment" },
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
	["@markup.raw.block"] = { link = "SpecialComment" },
	["@markup.list"] = { link = "Identifier" },
	["@markup.list.checked"] = { link = "Comment" },
	["@markup.list.unchecked"] = { link = "Identifier" },
	["@tag"] = { link = "Label" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@tag.attribute"] = { link = "Identifier" },
	["@diff.plus"] = { link = "DiffAdd" },
	["@diff.minus"] = { link = "DiffDelete" },
	["@diff.delta"] = { link = "DiffChange" },

	-- lsp (more to fill in here)
	DiagnosticError = { fg = colors.critical },
	DiagnosticUnderlineError = { sp = colors.critical, undercurl = true },
	-- nvim-cmp
	CmpItemAbbr = { link = "Comment" },
	CmpItemAbbrDeprecated = { link = "Visual" },
	CmpItemAbbrMatch = { link = "Identifier" },
	CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

	CmpItemKindText = { fg = colors.base0 },
	CmpItemKindSnippet = { fg = colors.base2 },
	CmpItemKindConstant = { fg = colors.blue },
	CmpItemKindVariable = { fg = colors.blue },
	CmpItemKindKeyword = { fg = colors.orange },
	CmpItemKindMethod = { fg = colors.purple },
	CmpItemKindFunction = { link = "CmpItemKindMethod" },
	CmpItemKindConstructor = { link = "CmpItemKindMethod" },
	CmpItemKindClass = { fg = colors.pink },
	CmpItemKindInterface = { link = "CmpItemKindClass" },
	CmpItemKindModule = { link = "CmpItemKindClass" },
	CmpItemKindStruct = { link = "CmpItemKindClass" },

	-- mini.files
	MiniFilesBorder = { link = "WinSeparator" }, -- border of regular windows.
	MiniFilesBorderModified = { link = "DiffChange" }, -- border of windows showing modified buffer.
	MiniFilesDirectory = { link = "SpecialKey" }, -- text and icon representing directory.
	MiniFilesFile = { link = "Identifier" }, -- text representing file.
	MiniFilesNormal = { link = "Normal" }, -- basic foreground/background highlighting.
	MiniFilesTitle = { link = "Comment" }, -- title of regular windows.
	MiniFilesTitleFocused = { link = "PreProc" }, -- title of focused window.
}

for name, val in pairs(hl_groups) do
	vim.api.nvim_set_hl(0, name, val)
end
