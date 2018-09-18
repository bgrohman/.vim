" ==================== Pathogen ====================
call pathogen#infect()
call pathogen#helptags()

" ============== Colorscheme ==============
syntax on
set background=dark

if has("gui_running")
    colorscheme monokai_bryan
else
    colorscheme default
endif

" ============== General config ====================

" Auto-load vimrc changes
augroup vimrc
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

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

if has("unix")
    " open vimrc
    map <leader>rc <ESC>:e $MYVIMRC<CR>

    if has("mac")
        " Open current file in browsers
        command! Chrome silent !/usr/bin/open -a "/Applications/Google Chrome.app" '%:p'

        " Open directory of current file in Finder
        command! Finder silent !/usr/bin/open '%:p:h'
    endif
else
    set fileformats=unix,dos
    command! DosFormat execute ":e ++ff=dos"

    " open vimrc
    map <leader>rc <ESC>:e $MYVIMRC<CR>
endif

if has("gui_running")
    if has("gui_macvim")
        set guifont=Menlo:h11
    elseif has("unix")
        set guifont=Monospace\ 10 
        set guioptions-=T
        if !exists("g:already_set_initial_dimensions")
            set lines=50
            set columns=120
            let already_set_initial_dimensions=1
        endif
    else
        set guifont=Consolas:h10
        " set guifont=Liberation\ Mono:h9
        set guioptions-=T
        if !exists("g:already_set_initial_dimensions")
            set lines=50
            set columns=120
            let already_set_initial_dimensions=1
        endif
    endif
endif

command! Paste call feedkeys('"+gP')

" ================ netrw config ====================
let g:netrw_home=$HOME          " Store history in home directory
let g:netrw_banner=0            " Hide banner
let g:netrw_altv=1              " Right splitting
let g:netrw_preview=1           " Preview window in vertical split
let g:netrw_winsize=30          " 30% for file browser
let g:netrw_liststyle=3         " Tree-style file browser
let g:netrw_browse_split=4      " <CR> acts like 'P' and opens in previous window

" ============== folding config ====================
set foldmethod=indent
set foldlevel=999
set foldignore=

" ================= Indentation ====================
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" ================== File Types ====================
augroup less
    autocmd!
    autocmd BufNewFile,BufRead *.less set filetype=css
augroup END

augroup markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal filetype=Markdown
augroup END

" ==================== Search ======================
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

" ============= Text Completion ====================
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.class,CVS,*.pyc,.svn,.git,.gitignore,.idea,bin,target,build,node,node_modules,bower_components,vendor

imap <C-Space> <C-x><C-o>
set omnifunc=syntaxcomplete#Complete

" ================= Syntastic ======================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

let g:syntastic_javascript_checkers = ['jshint']

" ================= Status Line ====================
set laststatus=2 "always show
set statusline=
set statusline+=%f%*\               "file name
set statusline+=%h%1*%m%r%w%0*                       "flags
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=                                   "right align
set statusline+=%10.(w:%{winnr()}\ l:%l%)\ %<%P      "window number, line number, percentage

" ============== General Key Mappings ==============
cmap w!! %!sudo tee > /dev/null %

" moving between visible lines
nnoremap j gj
nnoremap k gk

" prev/next buffer
map <right> <ESC>:bn<CR>
map <left> <ESC>:bp<CR>

" window resizing
map <S-up> <ESC>:resize +1<CR>
map <S-down> <ESC>:resize -1<CR>
map <S-left> <C-W><1
map <S-right> <C-W>>1

"nmap <C-V> "+gP
"imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" cd to current file's dir
map <leader>cd <ESC>:cd %:h<CR>

" list marks
map <leader>m <ESC>:marks a-zA-Z<CR>

" switching between tabs
map <C-tab> <ESC>:tabn<CR>
map <C-S-tab> <ESC>:tabp<CR>

" ====================== Diff ======================
" Diff two buffers in current window
command! DiffBuffs execute ":windo diffthis"

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
map <leader>diff <ESC>:DiffOrig<CR>
