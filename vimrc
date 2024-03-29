" Pathogen
" ========
call pathogen#infect()
call pathogen#helptags()

" Path
" ====
" empty = current directory
" ** = downward from the current directory
" . = relative to directory of current file
set path=,,**,.

" Colorscheme
" ===========
syntax on
set background=dark
colorscheme palenight

" General Config
" ==============
augroup vimrc
    autocmd!
    autocmd BufWritePost vimrc source %
augroup END

set encoding=utf-8

filetype plugin indent on
set nocompatible
set showmatch
set ruler
set number
set nowrap
set backup
set backupdir=~/.vim-backup
set directory=~/.vim-backup
set history=10000
set mousemodel=popup
set showcmd
set fo=tcqor
set splitbelow
set splitright
set scrolloff=3
set virtualedit=all

command! Paste call feedkeys('"+gP')

map <leader>rc <ESC>:e $MYVIMRC<CR>

if !has("unix")
    set fileformats=unix,dos
    command! DosFormat execute ":e ++ff=dos"
endif

" GVim UI
if !exists("g:already_set_initial_dimensions")
    let g:already_set_initial_dimensions = 0
endif
if has("gui_running")
    set guifont=Fira\ Mono\ 10 
    set guioptions-=T
    if g:already_set_initial_dimensions != 1
        set lines=45
        set columns=100
        let g:already_set_initial_dimensions = 1
    endif
endif

" General Key Mappings
" ====================
cmap w!! %!sudo tee > /dev/null %

" moving between visible lines
nnoremap j gj
nnoremap k gk

" prev/next buffer
map <right> <ESC>:bn<CR>
map <left> <ESC>:bp<CR>

" copying
vmap <C-C> "+y

" cd to current file's dir
map <leader>cd <ESC>:cd %:h<CR>

" list marks
map <leader>m <ESC>:marks a-zA-Z<CR>

" Windows
" =======

" window resizing
map <S-up> <ESC>:resize +1<CR>
map <S-down> <ESC>:resize -1<CR>
map <S-left> <C-W><1
map <S-right> <C-W>>1

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Netrw
" =====
let g:netrw_home=$HOME          " Store history in home directory
let g:netrw_banner=0            " Hide banner
let g:netrw_altv=1              " Right splitting

" Open vertical explore windows on the right
command! Vex execute ":Sexplore!"

" Folding
" =======
set foldmethod=indent
set foldlevel=999
set foldignore=

" Indentation
" ===========
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" File Types
" ==========
augroup fileTypeHandling
    autocmd!
    autocmd BufNewFile,BufRead *.less set filetype=css
    autocmd BufNewFile,BufRead *.md set filetype=markdown
augroup END

" Search
" ======
set incsearch
set hlsearch
set ignorecase
set smartcase 

" Make search results appear in the middle of the screen.
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Text Completion
" ===============
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.class,CVS,*.pyc,.svn,.git,.gitignore,.idea,bin,target,build,node,node_modules,bower_components,vendor

imap <C-Space> <C-x><C-o>
set omnifunc=syntaxcomplete#Complete

" Status Line
" ===========
set laststatus=2 "always show
set statusline=
set statusline+=%f%*\                                "file name
set statusline+=%h%m%r%w                             "flags
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=                                   "right align
set statusline+=%20.(%y\ w:%{winnr()}\ l:%l%)\ %<%P  "file type, window number, line number, percentage

" Tabs
" ====
set guitablabel=%N\ %t\ %m
set guitabtooltip=%F

map <C-tab> <ESC>:tabn<CR>
map <C-S-tab> <ESC>:tabp<CR>

" Syntastic
" =========
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_markdown_mdl_exec = 'markdownlint'
let g:syntastic_markdown_mdl_args = '--config ~/.vim/markdownlint.json'

function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = max([min([len(a:errors), 5]), 2])
    endif
endfunction

" Custom grep
" ===========
set grepprg=rg\ -i\ --vimgrep

" Open file in external program
" =============================
command! Open execute ":silent !xdg-open \"%:p\" &"
