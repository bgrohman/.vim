"========== New Windows ==========
command! NewOnTop execute ":topleft new"
command! NewOnBottom execute ":botright new"
command! NewOnLeft execute ":topleft vnew"
command! NewOnRight execute ":botright vnew"

"========= File Browsing =========
function! BrowseRight()
    execute ":botright 35vnew"
    execute ":Explore"
endfunction

function! BrowseLeft()
    execute ":topleft 35vnew"
    execute ":Explore"
endfunction

command! BrowseLeft call BrowseLeft()
command! BrowseRight call BrowseRight()
command! Browse execute ":BrowseLeft"

"========== Layout ==========
function! LayoutGrid(rowCount, colCount)
    let start_win_num = winnr()
    let r = 1

    while r <= a:rowCount
        let c = 1

        if r > 1
            execute ":new"
            execute ":wincmd J"
        endif

        while c <= a:colCount
            if c > 1
                execute ":vnew"
            endif
            let c += 1
        endwhile

        execute ":" . start_win_num . "wincmd w"
        let r += 1
    endwhile
endfunction
command! -nargs=* LayoutGrid call LayoutGrid(<f-args>)

function! LayoutFull()
    let winheight = &winminheight
    let winwidth = &winminwidth
    set winheight=3
    set winwidth=5
    set winminheight=3
    set winminwidth=5
    execute ":wincmd |"
    execute ":wincmd _"
    let &winminheight = winheight
    let &winminwidth = winwidth
    let &winheight = winheight
    let &winwidth = winwidth
endfunction

command! LayoutFull call LayoutFull()
command! LayoutFullHeight execute ":wincmd _"
command! LayoutFullWidth execute ":wincmd |"
command! LayoutEqual execute ":wincmd ="
