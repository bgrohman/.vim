let g:scratch_pad_file = "~/.vim-scratch-pad"
let g:scratch_pad_size_percent = 0.25

function! OpenScratchPad()
   let path = expand(g:scratch_pad_file, ":p")
   let size = float2nr(g:scratch_pad_size_percent * &lines)
   execute ":topleft " . size . "new"
   execute ":e " . path
endfunction
command! ScratchPad call OpenScratchPad()
