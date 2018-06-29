function MarkdownFoldLevel() 
    let h = matchstr(getline(v:lnum), '^#\+') 
    if empty(h) 
        return "=" 
    else 
        return ">" . len(h) 
    endif 
endfunction

function! SetLocalPlainTextStuff()
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
    setlocal comments=
    setlocal commentstring=>\ %s

    setlocal foldexpr=MarkdownFoldLevel()  
    setlocal foldmethod=expr 

    " Better indention/ hierarchy when formatting with "gq"
    " From https://www.reddit.com/r/vim/comments/4lvaok/supercharge_vim_formatting_for_plain_text/
    setlocal formatlistpat=^\\s*                    " Optional leading whitespace
    setlocal formatlistpat+=[                       " Start class
    setlocal formatlistpat+=\\[({]\\?               " |  Optionally match opening punctuation
    setlocal formatlistpat+=\\(                     " |  Start group
    setlocal formatlistpat+=[0-9]\\+                " |  |  A number
    setlocal formatlistpat+=\\\|[iIvVxXlLcCdDmM]\\+ " |  |  Roman numerals
    setlocal formatlistpat+=\\\|[a-zA-Z]            " |  |  A single letter
    setlocal formatlistpat+=\\)                     " |  End group
    setlocal formatlistpat+=[\\]:.)}                " |  Closing punctuation
    setlocal formatlistpat+=]                       " End class
    setlocal formatlistpat+=\\s\\+                  " One or more spaces
    setlocal formatlistpat+=\\\|^\\s*[-–+o*]\\s\\+  " Or ASCII style bullet points

    " call goyo#execute(0, [])
endfunction

function! SetPlainText()
    if has("gui_running")
        set background=light
    else
        set background=dark
    endif

    colorscheme plain

    call SetLocalPlainTextStuff()
endfunction

augroup plaintext
    autocmd!
    autocmd BufNewFile,BufRead *.txt call SetLocalPlainTextStuff()
    autocmd BufNewFile,BufRead *.md call SetLocalPlainTextStuff()
augroup END

command! PlainText call SetPlainText()
