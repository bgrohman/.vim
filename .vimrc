" ==================== Pathogen ====================
call pathogen#infect()
call pathogen#helptags()

" ============== Colorscheme ==============
syntax on
"colorscheme monokai

set background=light
colorscheme einkBryan

" ============== General config ====================

" Auto-load vimrc changes
autocmd! BufWritePost .vimrc source %

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
let g:netrw_home=$HOME

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
    map <leader>dos <ESC>:e ++ff=dos<CR>

    " open vimrc
    map <leader>rc <ESC>:e ~/development/git_repos/.vim/.vimrc<CR>
endif

if has("gui_running")
    set cursorline

    if has("gui_macvim")
        set guifont=Menlo:h11
    else
        set guifont=Consolas:h10
        set guioptions-=T
        if !exists("g:already_set_initial_dimensions")
            set lines=50
            set columns=120
            let already_set_initial_dimensions=1
        endif
    endif
endif

" ================= Indentation ====================
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

autocmd BufNewFile,BufRead *.less set filetype=css

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
set wildignore=*.o,*.class,CVS,*.pyc,.svn,.git,.gitignore,bin,target

imap <C-Space> <C-x><C-o>
set omnifunc=syntaxcomplete#Complete

" ================= Status Line ====================
set laststatus=2 "always show
set statusline=
set statusline+=%f\                                  "file name
set statusline+=%h%1*%m%r%w%0*                       "flags
set statusline+=%=                                   "right align
set statusline+=%-7.(win:%{winnr()}%)                "window number
set statusline+=%-14.(%l,%c%V%)\ %<%P                "offset

" ============== General Key Mappings ==============
cmap w!! %!sudo tee > /dev/null %

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

" ==================== NERDTree ====================
map <leader>nt <ESC>:NERDTreeToggle<CR>

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