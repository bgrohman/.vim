if !exists("g:notes_base_path")
    let g:notes_base_path = "~/Documents"
endif

function! Notes()
    execute "cd " . g:notes_base_path
    execute "set path=."

    if has("gui_running")
        set background=light
    else
        set background=dark
    endif
    colorscheme einkBryan

    highlight NoteTagsLine gui=italic cterm=italic term=italic
    highlight NoteTagskeyword gui=bold cterm=bold term=bold 
    set syntax=notes
    augroup notes
        autocmd!
        autocmd BufNewFile,BufRead *.txt set syntax=notes
    augroup END
endfunction

function! NotesByTag(tag)
    execute "call Notes()"
    execute "vimgrep /^Tags:.*" . a:tag . "/ " . g:notes_base_path . "/**/*.txt" 
endfunction

function! GetNoteTags()
    let tags = []
    let notes = split(globpath(g:notes_base_path, "**/*.txt"), "\n")

    for note in notes
        for line in readfile(note)
            if line =~ "^Tags:.*"
                let tags += split(substitute(substitute(substitute(line, "^Tags:", "", ""), "^\\s*\\|\\s*$", "", "g"), ",\\s*\\|\\s*,", ",", "g"), ",")
            endif
        endfor
    endfor

    return uniq(sort(tags))
endfunction

function! ShowNoteTags()
    echo join(GetNoteTags(), "\n")
endfunction

function NoteTagsAutoComplete(ArgLead, CmdLine, CursorPos)
    let match_filter = 'v:val =~ ".*' . a:ArgLead . '.*"'
    return filter(GetNoteTags(), match_filter)
endfunction

command! Notes call Notes() 
command! -nargs=? -complete=customlist,NoteTagsAutoComplete NotesByTag call NotesByTag(<q-args>)
command! NoteTags call ShowNoteTags()
