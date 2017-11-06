function! SetPlainText()
    if has("gui_running")
        set background=light
    else
        set background=dark
    endif

    colorscheme einkBryan
    setlocal syntax=on
    setlocal filetype=markdown

    setlocal spell
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    setlocal textwidth=80
    setlocal wrapmargin=0
    setlocal formatoptions=tcoqnl1j
    setlocal autoindent
    setlocal smartindent
    setlocal indentexpr=0
    setlocal breakindent
    setlocal colorcolumn=81
    setlocal comments=
    setlocal commentstring=>\ %s

    " Better indention/ hierarchy when formatting with "gq"
    set formatlistpat=^\\s*                    " Optional leading whitespace
    set formatlistpat+=[                       " Start class
    set formatlistpat+=\\[({]\\?               " |  Optionally match opening punctuation
    set formatlistpat+=\\(                     " |  Start group
    set formatlistpat+=[0-9]\\+                " |  |  A number
    set formatlistpat+=\\\|[iIvVxXlLcCdDmM]\\+ " |  |  Roman numerals
    set formatlistpat+=\\\|[a-zA-Z]            " |  |  A single letter
    set formatlistpat+=\\)                     " |  End group
    set formatlistpat+=[\\]:.)}                " |  Closing punctuation
    set formatlistpat+=]                       " End class
    set formatlistpat+=\\s\\+                  " One or more spaces
    set formatlistpat+=\\\|^\\s*[-–+o*]\\s\\+  " Or ASCII style bullet points

    " call goyo#execute(0, [])
endfunction

"autocmd BufNewFile,BufRead *.txt call SetPlainText()
"autocmd BufNewFile,BufRead *.md call SetPlainText()
command! PlainText call SetPlainText()
