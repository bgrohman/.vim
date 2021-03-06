" vim:sw=8:ts=8
"
" act like t_Co=0 but use (256) color on just a few things
"

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "einkBryan"

if !has('gui_running')
  if &background == "light"
    hi Normal       cterm=NONE          ctermbg=white   ctermfg=235
    hi SpecialKey   cterm=bold                          ctermfg=NONE
    hi IncSearch    cterm=reverse                       ctermfg=NONE
    hi Search       cterm=reverse                       ctermfg=NONE
    hi MoreMsg      cterm=bold                          ctermfg=NONE
    hi ModeMsg      cterm=bold                          ctermfg=NONE
    hi LineNr       cterm=NONE                          ctermfg=235
    hi StatusLine   cterm=bold,reverse                  ctermfg=NONE
    hi StatusLineNC cterm=reverse                       ctermfg=NONE
    hi VertSplit    cterm=reverse                       ctermfg=NONE
    hi Title        cterm=bold                          ctermfg=NONE
    hi Visual       cterm=reverse                       ctermfg=NONE
    hi VisualNOS    cterm=bold                          ctermfg=NONE
    hi WarningMsg   cterm=standout                      ctermfg=NONE
    hi WildMenu     cterm=standout                      ctermfg=NONE
    hi Folded       cterm=standout                      ctermfg=NONE
    hi FoldColumn   cterm=standout                      ctermfg=NONE
    hi DiffAdd      cterm=bold                          ctermfg=NONE
    hi DiffChange   cterm=bold                          ctermfg=NONE
    hi DiffDelete   cterm=bold                          ctermfg=NONE
    hi DiffText     cterm=reverse                       ctermfg=NONE
    hi Type         cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Keyword      cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Number       cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Char         cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Format       cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Special      cterm=underline     ctermbg=NONE    ctermfg=NONE
    hi Constant     cterm=None          ctermbg=NONE    ctermfg=NONE
    hi PreProc      cterm=None                          ctermfg=NONE
    hi Directive    cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Conditional  cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Comment      cterm=bold          ctermbg=NONE    ctermfg=240
    hi Func         cterm=None          ctermbg=234     ctermfg=250
    hi Identifier   cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Statement    cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Ignore       cterm=bold                          ctermfg=NONE
    hi String       term=underline                      ctermfg=NONE
    hi ErrorMsg     cterm=reverse       ctermbg=15      ctermfg=9
    hi Error        cterm=reverse       ctermbg=15      ctermfg=9
    hi Todo         cterm=bold,standout ctermbg=0       ctermfg=11
    hi MatchParen   cterm=bold          ctermbg=250     ctermfg=NONE
    hi ColorColumn                                      ctermbg=255
  else
    hi Normal       cterm=NONE          ctermbg=234     ctermfg=250
    hi SpecialKey   cterm=bold                          ctermfg=NONE
    hi IncSearch    cterm=reverse                       ctermfg=NONE
    hi Search       cterm=reverse                       ctermfg=NONE
    hi MoreMsg      cterm=bold                          ctermfg=NONE
    hi ModeMsg      cterm=bold                          ctermfg=NONE
    hi LineNr       cterm=NONE                          ctermfg=238
    hi StatusLine   cterm=bold,reverse                  ctermfg=NONE
    hi StatusLineNC cterm=reverse                       ctermfg=NONE
    hi VertSplit    cterm=reverse                       ctermfg=NONE
    hi Title        cterm=bold                          ctermfg=NONE
    hi Visual       cterm=reverse                       ctermfg=NONE
    hi VisualNOS    cterm=bold                          ctermfg=NONE
    hi WarningMsg   cterm=standout                      ctermfg=NONE
    hi WildMenu     cterm=standout                      ctermfg=NONE
    hi Folded       cterm=standout                      ctermfg=NONE
    hi FoldColumn   cterm=standout                      ctermfg=NONE
    hi DiffAdd      cterm=bold                          ctermfg=NONE
    hi DiffChange   cterm=bold                          ctermfg=NONE
    hi DiffDelete   cterm=bold                          ctermfg=NONE
    hi DiffText     cterm=reverse                       ctermfg=NONE
    hi Type         cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Keyword      cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Number       cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Char         cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Format       cterm=None          ctermbg=NONE    ctermfg=NONE
    hi Special      cterm=underline     ctermbg=NONE    ctermfg=NONE
    hi Constant     cterm=None          ctermbg=NONE    ctermfg=NONE
    hi PreProc      cterm=None                          ctermfg=NONE
    hi Directive    cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Conditional  cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Comment      cterm=NONE          ctermbg=NONE    ctermfg=245
    hi Func         cterm=None          ctermbg=234     ctermfg=250
    hi Identifier   cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Statement    cterm=NONE          ctermbg=NONE    ctermfg=NONE
    hi Ignore       cterm=bold                          ctermfg=NONE
    hi String       cterm=underline                     ctermfg=NONE
    hi ErrorMsg     cterm=reverse       ctermbg=15      ctermfg=9
    hi Error        cterm=reverse       ctermbg=15      ctermfg=9
    hi Todo         cterm=bold,standout ctermbg=0       ctermfg=11
    hi MatchParen   cterm=bold          ctermbg=250     ctermfg=NONE
    hi ColorColumn                      ctermbg=255
  endif
else
  if &background == "light"
    hi Normal       gui=NONE            guibg=white     guifg=gray11
    hi SpecialKey   gui=bold                            guifg=NONE
    hi IncSearch    gui=reverse                         guifg=NONE
    hi Search       gui=reverse                         guifg=NONE
    hi MoreMsg      gui=bold                            guifg=NONE
    hi ModeMsg      gui=bold                            guifg=NONE
    hi LineNr       gui=NONE                            guifg=gray60
    hi StatusLine   gui=bold,reverse                    guifg=NONE
    hi StatusLineNC gui=reverse                         guifg=NONE
    hi VertSplit    gui=reverse                         guifg=NONE
    hi Title        gui=bold                            guifg=NONE
    hi Visual       gui=reverse                         guifg=NONE
    hi VisualNOS    gui=bold                            guifg=NONE
    hi WarningMsg   gui=standout                        guifg=NONE
    hi WildMenu     gui=standout                        guifg=NONE
    hi Folded       gui=standout                        guifg=NONE
    hi FoldColumn   gui=standout                        guifg=NONE
    hi DiffAdd      gui=bold                            guifg=NONE
    hi DiffChange   gui=bold                            guifg=NONE
    hi DiffDelete   gui=bold                            guifg=NONE
    hi DiffText     gui=reverse                         guifg=NONE
    hi Type         gui=None            guibg=NONE      guifg=NONE
    hi Keyword      gui=None            guibg=NONE      guifg=NONE
    hi Number       gui=None            guibg=NONE      guifg=NONE
    hi Char         gui=None            guibg=NONE      guifg=NONE
    hi Format       gui=None            guibg=NONE      guifg=NONE
    hi Special      gui=underline       guibg=NONE      guifg=NONE
    hi Constant     gui=None            guibg=NONE      guifg=NONE
    hi PreProc      gui=None                            guifg=NONE
    hi Directive    gui=NONE            guibg=NONE      guifg=NONE
    hi Conditional  gui=NONE            guibg=NONE      guifg=NONE
    hi Comment      gui=bold            guibg=NONE      guifg=gray17
    hi Func         gui=None            guibg=NONE      guifg=gray17
    hi Identifier   gui=NONE            guibg=NONE      guifg=NONE
    hi Statement    gui=NONE            guibg=NONE      guifg=NONE
    hi Ignore       gui=bold                            guifg=NONE
    hi String       term=italic                         guifg=NONE
    hi ErrorMsg     gui=reverse         guibg=NONE      guifg=firebrick3
    hi Error        gui=reverse         guibg=NONE      guifg=firebrick3
    hi Todo         gui=bold,standout   guibg=NONE      guifg=darkgoldenrod2
    hi MatchParen   gui=bold            guibg=gray70    guifg=NONE
    hi ColorColumn                                      guifg=gray60
  else
    hi Normal       gui=NONE            guibg=#1d1f21   guifg=gray70
    hi SpecialKey   gui=bold                            guifg=NONE
    hi IncSearch    gui=reverse                         guifg=NONE
    hi Search       gui=reverse                         guifg=NONE
    hi MoreMsg      gui=bold                            guifg=NONE
    hi ModeMsg      gui=bold                            guifg=NONE
    hi LineNr       gui=NONE                            guifg=gray30
    hi StatusLine   gui=bold,reverse                    guifg=NONE
    hi StatusLineNC gui=reverse                         guifg=NONE
    hi VertSplit    gui=reverse                         guifg=NONE
    hi Title        gui=bold                            guifg=NONE
    hi Visual       gui=reverse                         guifg=NONE
    hi VisualNOS    gui=bold                            guifg=NONE
    hi WarningMsg   gui=standout                        guifg=NONE
    hi WildMenu     gui=standout                        guifg=NONE
    hi Folded       gui=standout                        guifg=NONE
    hi FoldColumn   gui=standout                        guifg=NONE
    hi DiffAdd      gui=bold                            guifg=NONE
    hi DiffChange   gui=bold                            guifg=NONE
    hi DiffDelete   gui=bold                            guifg=NONE
    hi DiffText     gui=reverse                         guifg=NONE
    hi Type         gui=None            guibg=NONE      guifg=NONE
    hi Keyword      gui=None            guibg=NONE      guifg=NONE
    hi Number       gui=None            guibg=NONE      guifg=NONE
    hi Char         gui=None            guibg=NONE      guifg=NONE
    hi Format       gui=None            guibg=NONE      guifg=NONE
    hi Special      gui=underline       guibg=NONE      guifg=NONE
    hi Constant     gui=None            guibg=NONE      guifg=NONE
    hi PreProc      gui=None                            guifg=NONE
    hi Directive    gui=NONE            guibg=NONE      guifg=NONE
    hi Conditional  gui=NONE            guibg=NONE      guifg=NONE
    hi Comment      gui=NONE            guibg=NONE      guifg=gray50
    hi Func         gui=None            guibg=NONE      guifg=gray50
    hi Identifier   gui=NONE            guibg=NONE      guifg=NONE
    hi Statement    gui=NONE            guibg=NONE      guifg=NONE
    hi Ignore       gui=bold                            guifg=NONE
    hi String       gui=italic                          guifg=NONE
    hi ErrorMsg     gui=reverse         guibg=NONE      guifg=firebrick3
    hi Error        gui=reverse         guibg=NONE      guifg=firebrick3
    hi Todo         gui=bold,standout   guibg=NONE      guifg=darkgoldenrod2
    hi MatchParen   gui=bold            guibg=gray45    guifg=NONE
    hi ColorColumn                      guibg=gray10
  endif
endif

" Bryan's customizations
hi Comment gui=italic
if &background == 'light'
	hi Statement gui=NONE term=bold cterm=bold guifg=grey50
	hi Identifier gui=NONE term=bold cterm=bold guifg=grey50
	hi Keyword gui=NONE guifg=grey50
	hi Cursor guifg=Black guibg=Pink
	hi CursorLine guifg=Black guibg=#f4f1f1
	hi CursorLineNr guifg=Black
	hi NonText guifg=DarkGray cterm=NONE ctermfg=7
	hi Search guifg=LightCyan guibg=Black ctermfg=6 ctermbg=0
	hi IncSearch guifg=LightCyan guibg=Black ctermfg=6 ctermbg=0
	hi ColorColumn guibg=#f7f7f7 guifg=gray11
	hi StatusLineNC term=reverse ctermbg=0 ctermfg=7 guibg=Black guifg=DarkGray
        hi Pmenu guibg=LightCyan guifg=Black
        hi PmenuSel guibg=Pink guifg=Black
        hi WildMenu gui=NONE guifg=Black guibg=LightCyan cterm=NONE ctermfg=0 ctermbg=6
else
	hi Statement gui=NONE term=NONE cterm=NONE guifg=White ctermfg=255
	hi Identifier gui=NONE term=NONE cterm=NONE guifg=White ctermfg=255
	hi Keyword gui=NONE term=NONE cterm=NONE guifg=White ctermfg=255
	hi Type gui=NONE term=NONE cterm=NONE guifg=NONE ctermfg=NONE
	hi Constant gui=NONE term=NONE cterm=NONE guifg=NONE ctermfg=NONE
	hi Special gui=NONE term=NONE cterm=underline guifg=NONE ctermfg=NONE
	hi Cursor guifg=Black guibg=Pink
	hi CursorLine guibg=#242629 cterm=NONE ctermbg=0
	hi CursorLineNr guifg=grey70 cterm=NONE ctermfg=3
	hi NonText guifg=grey70 cterm=NONE ctermfg=8
	hi Search guifg=LightCyan guibg=Black ctermfg=6 ctermbg=0
	hi IncSearch guifg=LightCyan ctermfg=0 ctermbg=6
	hi Visual guifg=Pink guibg=Black ctermfg=6 ctermbg=0
	hi ColorColumn ctermbg=8
	hi StatusLineNC term=reverse ctermbg=7 ctermfg=8 guibg=DarkGrey guifg=grey30
        hi Pmenu guibg=LightCyan guifg=Black
        hi PmenuSel guibg=Pink guifg=Black
        hi WildMenu gui=NONE guifg=Black guibg=LightCyan cterm=NONE ctermfg=0 ctermbg=6
        hi Folded gui=NONE guifg=Black
        hi FoldColumn gui=NONE guifg=Black
        hi markdownHeadingDelimiter guifg=White
        hi markdownHeadingRule guifg=White
        hi markdownH1 guifg=White
        hi markdownH2 guifg=White
        hi markdownH3 guifg=White
        hi markdownH4 guifg=White
        hi markdownH5 guifg=White
        hi markdownH6 guifg=White
        hi markdownBold guifg=White
        hi markdownBoldItalic guifg=White
endif

hi markdownHeadingDelimiter gui=bold
hi markdownHeadingRule gui=bold
hi markdownH1 gui=bold
hi markdownH2 gui=bold
hi markdownH3 gui=bold
hi markdownH4 gui=bold
hi markdownH5 gui=bold
hi markdownH6 gui=bold
hi markdownBold gui=bold
hi markdownBoldItalic gui=bold,italic
hi markdownItalic gui=italic
hi markdownUrl gui=italic
hi markdownUrlDelimiter gui=italic
hi markdownUrlTitle gui=italic
hi markdownUrlTitleDelimiter gui=italic
