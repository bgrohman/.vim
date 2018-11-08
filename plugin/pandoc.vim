if !exists("g:pandoc_command")
    let g:pandoc_command = "pandoc"
endif

function! pandoc#Convert(fileType)
    let file_path = expand("%:p")
    let file_path_no_extension = expand("%:r")

    let output_file_type = "pdf"
    if strlen(a:fileType)
        let output_file_type = a:fileType
    endif
    let output_file_path = file_path_no_extension . "." . output_file_type

    let command = "!" . g:pandoc_command . " " . file_path
    if output_file_type != "pdf"
        let command .= " -t " . output_file_type
    endif
    let command .= " -o " . output_file_path

    silent !clear
    execute command
endfunction

command! -nargs=? Pandoc call pandoc#Convert(<q-args>)
