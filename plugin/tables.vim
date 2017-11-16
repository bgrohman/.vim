" Turns this:
"
" ID,Food,Type,Tasty?
" 1,Pizza,Italian,Yes
" 2,Apples,Fruit,Yes
" 3,Bananas,Fruit,Yes
" 4,Asparagus,Vegetable,No
" 5,Broccoli,Vegetable,Yes
" 
" Into this:
"
" +----+-----------+-----------+--------+
" | ID | Food      | Type      | Tasty? |
" +====+===========+===========+========+
" | 1  | Pizza     | Italian   | Yes    |
" +----+-----------+-----------+--------+
" | 2  | Apples    | Fruit     | Yes    |
" +----+-----------+-----------+--------+
" | 3  | Bananas   | Fruit     | Yes    |
" +----+-----------+-----------+--------+
" | 4  | Asparagus | Vegetable | No     |
" +----+-----------+-----------+--------+
" | 5  | Broccoli  | Vegetable | Yes    |
" +----+-----------+-----------+--------+

let g:tables_default_separator = ","
let g:tables_column_separator = "|"
let g:tables_vertex = "+"

function! s:Trim(x)
    return substitute(a:x, '^\s*\(.\{-}\)\s*$', '\1', '') 
endfunction

function! tables#Table(start_line, end_line, ...)
    let separator = g:tables_default_separator
    if a:0 > 0
        let separator = a:1
    endif

    let num_columns = len(split(getline(a:start_line), separator))
    let max_column_lengths = map(range(num_columns), 0)

    " Get the column sizes
    for i in range(a:start_line, a:end_line)
        let columns = map(split(getline(i), separator), 's:Trim(v:val)')

        for j in range(len(columns))
            let l = strdisplaywidth(columns[j]) + 1

            if l > get(max_column_lengths, j)
                let max_column_lengths[j] = l
            endif
        endfor
    endfor

    " Add the top border
    let border_line = g:tables_vertex
    for j in range(num_columns)
        let border_line .= repeat("-", get(max_column_lengths, j) + 1) . g:tables_vertex
    endfor
    let header_line = substitute(border_line, "-", "=", "g")
    call append(a:start_line - 1, border_line)

    " Format each line and add borders
    let line_count = 0
    for i in range(a:start_line + 1, a:end_line + 1)
        let columns = map(split(getline(i + line_count), separator), 's:Trim(v:val)')
        let text = g:tables_column_separator

        for j in range(len(columns))
            let value = get(columns, j)
            let text .= " " . value

            let padding = get(max_column_lengths, j) - strlen(value)
            if padding > 0
                let text .= repeat(" ", padding)
            endif

            let text .= g:tables_column_separator
        endfor

        call setline(i + line_count, text)

        if line_count == 0
            call append(i + line_count, header_line)
        else
            call append(i + line_count, border_line)
        endif

        let line_count += 1
    endfor
endfunction

function! tables#Untable(start_line, end_line, ...)
    let separator = g:tables_default_separator
    if a:0 > 0
        let separator = a:1
    endif

    let deleted_lines_count = 0

    for i in range(a:start_line, a:end_line)
        let line = getline(i - deleted_lines_count)

        if stridx(line, g:tables_vertex) == 0
            execute ":" . (i - deleted_lines_count)
            normal! dd
            let deleted_lines_count += 1
        elseif stridx(line, g:tables_column_separator) == 0
            let text = join(map(split(line, g:tables_column_separator), 's:Trim(v:val)'), separator)
            call setline(i - deleted_lines_count, text)
        endif
    endfor
endfunction

command! -range -nargs=? Table call tables#Table(<line1>, <line2>, <f-args>)
command! -range -nargs=? Untable call tables#Untable(<line1>, <line2>, <f-args>)
