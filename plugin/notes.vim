if !exists("g:notes_base_path")
    let g:notes_base_path = "~/Dropbox/Notes"
endif

function! Notes()
    execute "cd " . g:notes_base_path
    execute "set path=."
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
