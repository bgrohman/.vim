if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal wrap
setlocal linebreak
setlocal nolist
setlocal textwidth=0
setlocal wrapmargin=0
setlocal formatoptions-=t
setlocal formatoptions+=1
