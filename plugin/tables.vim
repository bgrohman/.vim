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

function! tables#Table(line1, line2, ...)
    let separator = ","
    if a:0 > 0
        let separator = a:1
    endif

    let num_columns = len(split(getline(a:line1), separator))
    let max_column_lengths = map(range(num_columns), 0)

    " Get the column sizes
    for i in range(a:line1, a:line2)
        let columns = split(getline(i), separator)

        for j in range(len(columns))
            let l = strdisplaywidth(columns[j]) + 1

            if l > get(max_column_lengths, j)
                let max_column_lengths[j] = l
            endif
        endfor
    endfor

    " Add the top border
    let border_line = "+"
    for j in range(num_columns)
        let border_line .= repeat("-", get(max_column_lengths, j) + 1) . "+"
    endfor
    let header_line = substitute(border_line, "-", "=", "g")
    call append(a:line1 - 1, border_line)

    " Format each line and add borders
    let line_count = 0
    for i in range(a:line1 + 1, a:line2 + 1)
        let columns = split(getline(i + line_count), separator)
        let text = "|"

        for j in range(len(columns))
            let value = get(columns, j)
            let text .= " " . value

            let padding = get(max_column_lengths, j) - strlen(value)
            if padding > 0
                let text .= repeat(" ", padding)
            endif

            let text .= "|"
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

command! -range -nargs=? Table call tables#Table(<line1>, <line2>, <f-args>)
