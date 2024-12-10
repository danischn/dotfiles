vim.cmd([[hi clear]])
vim.g.colors_name = "iben"
vim.o.background = "light"

local colors = {
	base0 = "#1A1918", -- hsv(30, 8%, 10%)
	base1 = "#595855", -- hsv(45, 4%, 35%)
	base2 = "#807E79", -- hsv(43, 5%, 50%)
	base3 = "#999791", -- hsv(45, 5%, 60%)
	base4 = "#B3B1AD", -- hsv(40, 3%, 70%)
	base5 = "#CCCBC6", -- hsv(50, 3%, 80%)
	base6 = "#E6E4DF", -- hsv(43, 3%, 90%)
	base7 = "#FAF2EB", -- hsv(24, 4%, 98%)

	light_orange = "#FAE1C8", -- hsv(30, 20%, 98%)
	light_yellow = "#FAFAC8", -- hsv(60, 20%, 98%)
	light_cyan = "#C8FAFA", -- hsv(180, 20%, 98%)
	light_green = "#D4FAD4", -- hsv(120, 15%, 98%)
	light_blue = "#D4D4FA", -- hsv(240, 15%, 98%)
	light_purple = "#EDD4FA", -- hsv(280, 15%, 98%)
	light_pink = "#FAD4ED", -- hsv(320, 15%, 98%)
	light_red = "#FAD4D4", -- hsv(360, 15%, 98%)

	orange = "#F27900", -- hsv(30, 100%, 95%)
	yellow = "#F2F200", -- hsv(60, 100%, 95%)
	cyan = "#00A6A6", -- hsv(180, 100%, 65%)
	green = "#00A600", -- hsv(120, 100%, 65%)
	blue = "#0000A6", -- hsv(240, 100%, 65%)
	purple = "#6F00A6", -- hsv(280, 100%, 65%)
	pink = "#A6006F", -- hsv(320, 100%, 65%)
	red = "#A60000", -- hsv(360, 100%, 65%)
}

local hl_groups = {
	Normal = { fg = colors.base0, bg = colors.base7 },
	NormalFloat = { link = "Normal" },
	NonText = { fg = colors.base3 },

	SpecialKey = { fg = colors.blue },
	Directory = { link = "SpecialKey" },

	Title = { fg = colors.base0, bold = true },

	IncSearch = { fg = colors.base0, bg = colors.light_yellow },
	Search = { link = "IncSearch" },
	CurSearch = { link = "IncSearch" },

	LineNr = { fg = colors.base3 },
	CursorLineNr = { link = "Normal" },

	Question = { fg = colors.base0, bold = true },

	StatusLine = { fg = colors.base0, bg = colors.base7, bold = true },
	StatusLineNC = { fg = colors.base0, bg = colors.base7 },

	TabLine = { link = "Normal" },
	TabLineSel = { reverse = true },

	WinSeparator = { fg = colors.base0 },

	SignColumn = { link = "LineNr" },
	FoldColumn = { link = "SignColumn" },

	Conceal = { fg = colors.base5 },
	SpellBad = { fg = colors.base0, undercurl = true },
	SpellCap = { link = "SpellBad" },
	SpellLocal = { link = "SpellBad" },
	SpellRare = { link = "SpellBad" },

	Pmenu = { fg = colors.base0, bg = colors.base7 },
	PmenuSel = { fg = colors.base0, bg = colors.base3 },
	PmenuSbar = { bg = colors.base0 },
	PmenuThumb = { link = "PmenuSbar" },

	WildMenu = { bg = colors.base4 },
	Visual = { bg = colors.base5 },
	Folded = {},

	Cursor = { bg = colors.base2 },
	TermCursor = { link = "Cursor" },
	CursorLine = { bg = colors.base6 },
	CursorColumn = { link = "CursorLine" },

	ColorColumn = { bg = colors.light_yellow },

	MoreMsg = { fg = colors.cyan },
	ModeMsg = { fg = colors.blue },
	ErrorMsg = { fg = colors.base7, bg = colors.red },
	WarningMsg = { fg = colors.base7, bg = colors.orange },

	DiffAdd = { fg = colors.green },
	DiffChange = { fg = colors.orange },
	DiffDelete = { fg = colors.red },

	Comment = { fg = colors.base3 },
	Constant = { fg = colors.base0, bg = colors.light_blue }, -- String Character Number Boolean Float
	String = { fg = colors.base0, bg = colors.light_green },
	Identifier = { fg = colors.base0 },
	Delimiter = { link = "Identifier" },
	Statement = { fg = colors.base0, bg = colors.light_orange }, -- Conditional Repeat Label Operator Keyword Exception
	Operator = { link = "Identifier" },
	PreProc = { link = "Question" }, -- Include Define Macro PreCondit
	Type = { fg = colors.pink }, -- StorageClass Structure Typedef
	Special = { link = "SpecialKey" }, -- SpecialChar Tag Delimiter SpecialComment Debug
	Function = { fg = colors.base0, bold = true },
	Underlined = { underline = true },
	Ignore = { fg = colors.base7 },
	Error = { link = "ErrorMsg" },
	Todo = { fg = colors.green },

	MatchParen = { fg = colors.red, underline = true },

	-- Plugins

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
	["@function.builtin"] = { link = "Special" },
	["@function.call"] = { link = "Special" },
	["@function.macro"] = { link = "Macro" },

	["@function.method"] = { link = "@function" },
	["@function.method.call"] = { link = "@function.call" },

	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },

	["@keyword"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Keyword" },
	["@keyword.function"] = { bg = colors.light_purple },
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

	-- lsp
	DiagnosticError = { fg = colors.red },
	DiagnosticHint = { fg = colors.base3 },
	DiagnosticInfo = { fg = colors.blue },
	DiagnosticOk = { fg = colors.green },
	DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
	DiagnosticUnderlineHint = { sp = colors.base3, undercurl = true },
	DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
	DiagnosticUnderlineOk = { sp = colors.green, undercurl = true },
	DiagnosticUnderlineWarn = { sp = colors.orange, undercurl = true },
	DiagnosticWarn = { fg = colors.orange },

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
