" ==================== Pathogen ====================
call pathogen#infect()
call pathogen#helptags()

" ============== General config ====================
syntax on
filetype plugin indent on
colorscheme monokai
set colorcolumn=80
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
if has("gui_running")
	set guifont=Menlo:h10
endif

" ================== Sessions ======================
set viewdir=~/.vim-views

autocmd BufWinLeave *.* mkview
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * call SaveSession()

autocmd VimEnter * call LoadSession()
autocmd BufWinEnter *.* silent loadview

function! SaveSession()
	execute 'mksession! ~/.vim-sessions/last-session.vim'
endfunction

function! LoadSession()
	if argc() == 0
		execute 'source ~/.vim-sessions/last-session.vim'
	endif
endfunction

" ================= Indentation ====================
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
autocmd FileType * setlocal noet

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

" ================= Status Line ====================
set laststatus=2 "always show
set statusline=
set statusline+=%f\                                  "file name
set statusline+=%h%1*%m%r%w%0*                       "flags
set statusline+=%#warningmsg#                        "Syntastic
set statusline+=%{SyntasticStatuslineFlag()}         "Syntastic
set statusline+=%*                                   "Syntastic
set statusline+=%=                                   "right align
set statusline+=%-14.(%l,%c%V%)\ %<%P                "offset

" ============== General Key Mappings ==============
cmap w!! %!sudo tee > /dev/null %
" open vimrc
map <leader>rc <ESC>:e $MYVIMRC<CR>
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
" Reload file in current buffer
map <leader>r <ESC>:set noconfirm<CR>:bufdo e!<CR>:set confirm<CR>
" cd to current file's dir
map <leader>cd <ESC>:cd %:h<CR>

" =================== syntastic ====================
nmap <F4> :SyntasticCheck<CR>
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['java','html','css']}
let g:syntastic_javascript_jslint_conf = "--white --browser --nomen --regexp --plusplus --predef define --predef require"

" ==================== NERDTree ====================
map <leader>nt <ESC>:NERDTreeToggle<CR>

" ==================== Command-T ===================
let g:CommandTMaxFiles=20000 " default is 10000
let g:CommandTMaxDepth=30 " default is 15
let g:CommandTMaxHeight=30 " default is 0 which means no max
map <leader>j <ESC>:CommandTJump<CR>

" ==================== VimClojure ==================
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/lib/vimclojure-nailgun-client/ng"
let g:paredit_mode = 0
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

" ====================== Misc ======================
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
map <leader>diff <ESC>:DiffOrig<CR>

" Auto-load vimrc changes
autocmd! BufWritePost .vimrc source %

" Open current file in browsers
map <leader>chrome <ESC>:silent !/usr/bin/open -a "/Applications/Google Chrome.app" '%:p'<CR>
map <leader>ff <ESC>:silent !/usr/bin/open -a "/Applications/Firefox.app" '%:p'<CR>
