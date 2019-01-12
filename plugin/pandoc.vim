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

    let output_file_ext = output_file_type
    if output_file_type == "slidy"
        let output_file_ext = "html"
    endif
    let output_file_path = file_path_no_extension . "." . output_file_ext

    let command = "!" . g:pandoc_command . " " . file_path
    if output_file_type != "pdf"
        let command .= " -t " . output_file_type
    endif
    if output_file_type == "slidy"
        let command .= " --self-contained"
    endif
    let command .= " -o " . output_file_path

    silent !clear
    execute command

    if has("unix")
        execute "!xdg-open " . output_file_path . " &"
    endif
endfunction

command! -nargs=? Pandoc call pandoc#Convert(<q-args>)
