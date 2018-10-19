function! GitAutoCommit()
    let date = strftime(localtime())
    if has("win32")
        let commandSeparator = "&&"
    else
        let commandSeparator = ";"
    endif
    silent !clear
    execute "!git add . " . commandSeparator . " git commit -m \"git auto commit " . date . "\" " . commandSeparator . " git push"
endfunction

command! AutoCommit call GitAutoCommit()
command! GitAutoCommit call GitAutoCommit()
