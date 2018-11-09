function! GitAutoCommit()
    let date = strftime(localtime())
    if has("win32")
        let commandSeparator = "&&"
    else
        let commandSeparator = ";"
    endif
    silent !clear
    execute "!git add . " . commandSeparator . " git commit -m \"git auto commit " . date . "\" "
endfunction

function! GitAutoCommitAndPush()
    call GitAutoCommit()
    execute "!git push"
endfunction

command! AutoCommit call GitAutoCommit()
command! AutoCommitAndPush call GitAutoCommitAndPush()
command! GitAutoCommit call GitAutoCommit()
command! GitAutoCommitAndPush call GitAutoCommitAndPush()
