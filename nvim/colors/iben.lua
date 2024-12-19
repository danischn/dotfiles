vim.cmd("hi clear")
vim.g.colors_name = "deepwhite"
vim.o.background = "light"

local c = {
	base0 = "#1A1918",
	base1 = "#595855",
	base2 = "#807E79",
	base3 = "#999791",
	base4 = "#B3B1AD",
	base5 = "#CCCBC6",
	base6 = "#E6E4DF",
	base7 = "#FAF2EB",

	light_orange = "#FAE1C8",
	light_yellow = "#FAFAC8",
	light_cyan = "#C8FAFA",
	light_green = "#D4FAD4",
	light_blue = "#D4D4FA",
	light_purple = "#EDD4FA",
	light_pink = "#FAD4ED",
	light_red = "#FAD4D4",

	orange = "#F27900",
	yellow = "#F2F200",
	cyan = "#00A6A6",
	green = "#00A600",
	blue = "#0000A6",
	purple = "#6F00A6",
	pink = "#A6006F",
	red = "#A60000",
}

local groups = {
	Normal = { fg = c.base0, bg = c.base7 },
	NormalFloat = { link = "Normal" },
	Comment = { fg = c.base3 },
	NonText = { fg = c.base3 },

	Constant = { fg = c.base0, bg = c.light_blue },
	String = { fg = c.green },
	Number = { link = "Constant" },
	Boolean = { link = "Constant" },
	Float = { link = "Constant" },

	Identifier = { fg = c.base0 },
	Function = { link = "Identifier" },

	Statement = { fg = c.base0, bg = c.light_orange },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = { fg = c.base0 },
	Keyword = { link = "Statement" },
	Exception = { link = "Statement" },

	Question = { fg = c.base0, bold = true },
	PreProc = { link = "Question" },
	Include = { link = "Question" },
	Define = { link = "Question" },
	Macro = { link = "Question" },
	PreCondit = { link = "Question" },

	Type = { fg = c.pink },
	StorageClass = { link = "Type" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },

	Special = { fg = c.blue },
	SpecialChar = { link = "Special" },
	Tag = { link = "Special" },
	Delimiter = { link = "Identifier" },
	SpecialComment = { link = "Special" },
	Debug = { link = "Special" },

	Underlined = { underline = true },

	Directory = { link = "SpecialKey" },

	Title = { fg = c.base0, bold = true },

	IncSearch = { fg = c.base0, bg = c.light_yellow },
	Search = { link = "IncSearch" },
	CurSearch = { link = "IncSearch" },

	LineNr = { fg = c.base3 },
	CursorLineNr = { link = "Normal" },

	StatusLine = { fg = c.base0, bg = c.base7, bold = true },
	StatusLineNC = { fg = c.base0, bg = c.base7 },

	TabLine = { link = "Normal" },
	TabLineSel = { reverse = true },

	WinSeparator = { fg = c.base0 },

	SignColumn = { link = "LineNr" },
	FoldColumn = { link = "SignColumn" },

	Conceal = { fg = c.base5 },
	SpellBad = { fg = c.base0, undercurl = true },
	SpellCap = { link = "SpellBad" },
	SpellLocal = { link = "SpellBad" },
	SpellRare = { link = "SpellBad" },

	Pmenu = { fg = c.base0, bg = c.base7 },
	PmenuSel = { fg = c.base0, bg = c.base3 },
	PmenuSbar = { bg = c.base0 },
	PmenuThumb = { link = "PmenuSbar" },

	WildMenu = { bg = c.base4 },
	Visual = { bg = c.base5 },
	Folded = {},

	Cursor = { bg = c.base2 },
	TermCursor = { link = "Cursor" },
	CursorLine = { bg = c.base6 },
	CursorColumn = { link = "CursorLine" },

	ColorColumn = { bg = c.light_yellow },

	MoreMsg = { fg = c.cyan },
	ModeMsg = { fg = c.blue },
	ErrorMsg = { fg = c.base7, bg = c.red },
	WarningMsg = { fg = c.base7, bg = c.orange },

	DiffAdd = { fg = c.green },
	DiffChange = { fg = c.orange },
	DiffDelete = { fg = c.red },

	Ignore = { fg = c.base7 },
	Error = { link = "ErrorMsg" },
	Todo = { fg = c.green },

	MatchParen = { fg = c.red, underline = true },

	-- Treesittere
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
	["@function.builtin"] = { link = "Special" },
	["@function.call"] = { link = "Special" },
	["@function.macro"] = { link = "Macro" },

	["@function.method"] = { link = "@function" },
	["@function.method.call"] = { link = "@function.call" },

	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },

	["@keyword"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Keyword" },
	["@keyword.function"] = { bg = c.light_purple },
	["@keyword.operator"] = { link = "Keyword" },
	["@keyword.import"] = { link = "Include" },
	["@keyword.storage"] = { link = "Keyword" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.return"] = { link = "Keyword" },
	["@keyword.debug"] = { link = "Debug" },
	["@keyword.exception"] = { link = "Exception" },

	["@keyword.conditional"] = { link = "Conditional" },
	["@keyword.conditional.ternary"] = { link = "Conditional" },
	["@keyword.directive"] = { link = "PreProc" },
	["@keyword.directive.define"] = { link = "PreProc" },

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
	DiagnosticError = { fg = c.red },
	DiagnosticHint = { fg = c.base3 },
	DiagnosticInfo = { fg = c.blue },
	DiagnosticOk = { fg = c.green },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.base3, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.blue, undercurl = true },
	DiagnosticUnderlineOk = { sp = c.green, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.orange, undercurl = true },
	DiagnosticWarn = { fg = c.orange },

	-- lsp highlights
	["@lsp.type.class"] = { link = "@type" },
	["@lsp.type.decorator"] = { link = "@function" },
	["@lsp.type.enum"] = { link = "@type" },
	["@lsp.type.enumMember"] = { link = "@constant" },
	["@lsp.type.function"] = { link = "@function.call" },
	["@lsp.type.interface"] = { link = "@type" },
	["@lsp.type.macro"] = { link = "@macro" },
	["@lsp.type.method"] = { link = "@function.call" },
	["@lsp.type.namespace"] = { link = "@namespace" },
	["@lsp.type.parameter"] = { link = "@parameter" },
	["@lsp.type.property"] = { link = "@property" },
	["@lsp.type.struct"] = { link = "@structure" },
	["@lsp.type.type"] = { link = "@type" },
	["@lsp.type.variable"] = { link = "@variable" },
	["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
	["@lsp.typemod.function.declaration"] = { link = "@function" },
	["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
	["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.method.declaration"] = { link = "@function" },
	["@lsp.typemod.operator.injected"] = { link = "@operator" },
	["@lsp.typemod.string.injected"] = { link = "@string" },
	["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
	["@lsp.typemod.variable.injected"] = { link = "@variable" },

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
