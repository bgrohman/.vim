function! SetPlainText()
    if has("gui_running")
        set background=light
    else
        set background=dark
    endif
    colorscheme einkBryan

    setlocal wrap
    setlocal linebreak
    setlocal nolist
    setlocal textwidth=0
    setlocal wrapmargin=0
    setlocal formatoptions-=t
    setlocal formatoptions+=1
    setlocal noautoindent
    setlocal nosmartindent
    setlocal indentexpr=0
    setlocal breakindent
    setlocal colorcolumn=80
endfunction

autocmd BufNewFile,BufRead *.txt call SetPlainText()
autocmd BufNewFile,BufRead *.md call SetPlainText()
command! PlainText call SetPlainText()
