function! SetPlainText()
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
    setlocal breakindentopt=shift:2
endfunction

autocmd BufNewFile,BufRead *.txt call SetPlainText()
command! PlainText call SetPlainText()
