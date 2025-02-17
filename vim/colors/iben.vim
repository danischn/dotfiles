" Clear previous highlights and set color scheme name
hi clear
let g:colors_name = "iben"
set background=light

" Define colors
let s:black = "#000000"
let s:bg = "#FAF2EB"
let s:def = "#325CC0"
let s:constant = "#8945B0"
let s:string = "#448C27"
let s:comment = "#999791"
let s:active = "#FFBC5D"
let s:error = "#D13E23"
let s:warn = "#F4B371"
let s:hint = "#8EBEEC"
let s:info = "#88CC66"

" Set highlight groups
hi Normal guifg=s:black guibg=s:bg
hi NormalFloat link Normal
hi Comment guifg=s:comment
hi NonText guifg=#696969
hi EndOfBuffer guifg=s:bg

hi Constant guifg=s:black
hi String guifg=s:string
hi Number link Constant
hi Boolean link Constant
hi Float link Constant

hi Identifier guifg=s:black
hi Function guifg=s:def

hi Statement guifg=s:black gui=bold
hi Conditional link Statement
hi Repeat link Statement
hi Label link Statement
hi Operator guifg=s:black
hi Keyword link Statement
hi Exception link Statement

hi Question guifg=s:black
hi PreProc link Question
hi Include link Question
hi Define link Question
hi Macro link Question
hi PreCondit link Question

hi Type guifg=s:black
hi StorageClass link Type
hi Structure link Type
hi Typedef link Type

hi Special guifg=s:black
hi SpecialKey link Special
hi SpecialChar link Special
hi Tag guifg=s:black gui=underline
hi Delimiter link Special
hi SpecialComment link Special
hi Debug link Special

hi Underlined gui=underline

hi Directory link SpecialKey

hi Title guifg=s:constant

hi IncSearch guifg=s:black guibg=s:active
hi Search link IncSearch
hi CurSearch link IncSearch

hi LineNr guifg=#7d7c7c
hi CursorLineNr link Normal

hi StatusLine guifg=#555555 guibg=#E6E4DF
hi StatusLineNC guifg=#555555 guibg=s:bg
hi StatusLineCWD guifg=#555555 guibg=#E6E4DF gui=bold

hi TabLine link Normal
hi TabLineSel gui=reverse

hi WinSeparator guifg=s:black

hi SignColumn link LineNr
hi FoldColumn link SignColumn

hi Conceal guifg=#b0b0b0
hi SpellBad gui=undercurl guisp=#AA3731
hi SpellCap gui=undercurl guisp=#325CC0
hi SpellLocal gui=undercurl guisp=#0083b2
hi SpellRare gui=undercurl guisp=#7A3E9D

hi Pmenu guifg=s:black
hi PmenuSel link CursorLine

hi Visual link CursorLine
hi Folded NONE

hi TermCursor link Cursor
hi CursorLine guibg=#E6E4DF
hi CursorColumn link CursorLine

hi MoreMsg guifg=#448c27 gui=bold
hi ErrorMsg guifg=s:black guibg=#AA3731
hi WarningMsg guifg=#e1ad4c

hi Ignore NONE
hi Error link ErrorMsg
hi Todo guibg=#d0d058 guifg=s:bg

hi MatchParen guifg=#AA3731 gui=underline
