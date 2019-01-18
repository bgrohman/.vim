" Find files using fd

function! fdfind#Fd(fdArgs)
    set errorformat=%f
    let fd_command = "fd -tf " . a:fdArgs
    silent !clear
    execute ":cexpr system('" . fd_command . "')"
    set errorformat&
endfunction

command! -nargs=? Find call fdfind#Fd(<q-args>)
