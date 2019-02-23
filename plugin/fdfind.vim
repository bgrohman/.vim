" Find files using fd
"
" TODO: 
" 
" * Execute fd first and capture output. Only use cexpr if there are more than
" one result.
"
" * Tab completion

function! fdfind#Fd(fdArgs)
    set errorformat=%f
    let fd_command = "fd -tf " . a:fdArgs
    silent !clear
    execute ":cexpr system('" . fd_command . "')"
    set errorformat&
endfunction

command! -nargs=? Find call fdfind#Fd(<q-args>)
