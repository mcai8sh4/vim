set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="mcai8sh4"
hi Normal guifg=#ffffff guibg=#000000
hi Comment guifg=#757575 guibg=NONE
hi Constant guifg=#ff00ff guibg=NONE
hi String guifg=#0cf500 guibg=NONE
hi htmlTagName guifg=#ff0000 guibg=NONE
hi Identifier guifg=#00ff09 guibg=NONE
hi Statement guifg=#ff0000 guibg=NONE
hi PreProc guifg=#ff80ff guibg=NONE
hi Type guifg=#60ff60 guibg=NONE
hi Function guifg=#fff200 guibg=NONE
hi Repeat guifg=#ff00ff guibg=NONE
hi Operator guifg=#ffd500 guibg=NONE
hi Error guibg=#ff0000 guifg=#ffffff
hi TODO guibg=#0011ff guifg=#ffffff
hi link character	constant
hi link number	constant
hi link boolean	constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link htmlTag	Special
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special