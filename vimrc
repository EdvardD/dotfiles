" Use Vim settings, rather than Vi settings.
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'wincent/command-t'

call vundle#end()
filetype plugin indent on

" Don't create swap files
set noswapfile

" Merge system clipboard with default vim
set clipboard=unnamed
set go+=a

" Autoindent
set autoindent
" Smart indents
filetype plugin indent on
"set smartindent
" Enable syntax highighting
syntax on

" Assign tab len equals to 2
set shiftwidth=2
set tabstop=2
" Use spaces instead of tabs
set expandtab

" Autorefresh opened files
set autoread

" Show relative line numbers
set number
set relativenumber

" Allow backspace over evrything in insert mode
set backspace=indent,eol,start

" At least 10 lines above and below the current line
set scrolloff=10

" Show tabs even only one exists
set showtabline=2
" Navigate over tabs
noremap <S-Tab> gT
noremap <Tab> gt

" Navigate over buffers
noremap <C-n> gT
noremap <C-p> gt

" Inverse color for selecting
hi Visual ctermfg=none ctermbg=none cterm=inverse

" Ignore case during a search
set ignorecase

" Override the 'ignorecase' if the search pattern contains upper case characters
set smartcase

" Highlight occurences of a search
set hlsearch

" Compiling by F7, running by F9
nmap <F7> :w<CR>:!g++-7 -Wno-deprecated -Wno-deprecated-declarations -Wall -Wextra -Wconversion -lm -s -x c++ -DSU1 -O2 -pthread -std=c++11 -o %:r %<CR>
nmap <F9> :!./%:r<CR>

" Ignore special symbols in find/replace
set nomagic
" Replacing from current line with global & confirm flags by R. Example: :R/old/new
:command! -nargs=1 R .,$s<args>/gc

" Ignore arrows and Esc
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Esc> <NOP>

" Ctrl-hjkl as arrows in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Ctrl-hjkl to move between splits in normal mode
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Always show the status line
set laststatus=2
" Format the status line
set statusline=File:\ %F%m%r%h\ %w\ \ Path:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ Symbol:\ %c

" Switch between C++ header and source files
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Sets how many lines of history VIM has to remember
set history=1000

" Graphical completion in vim command line
set wildmenu
" Ignore compiled files during completion
set wildignore=*.o,*~,*.pyc

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Delete trailing white spaces after each write
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.* :call DeleteTrailingWS()

" NERDTree settings
nnoremap <Bs> :<C-u>NERDTreeToggle<CR>
" Show bookmarks on startup
let NERDTreeShowBookmarks=1
" Change working directory to the new root
"let NERDTreeChDirMode=2
" Hide NERD on each open
let NERDTreeQuitOnOpen=1
" Show hidden files
let NERDTreeShowHidden=1
" Disable display of the 'Bookmarks' label and 'Press ? for help' text
let NERDTreeMinimalUI=1
" Store bookmarks in FS
let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

" Reload vimrc after saving it
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Navigate through wrapped lines
noremap j gj
noremap k gk

" Search matches are always in center
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" Y from cursor position to the end of line
nnoremap Y y$

" Load previous session. Only available when compiled with the +viminfo feature
set viminfo='10,\"100,:20,%,n~/.viminfo
" Set cursor to its last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Doesn't work right now
" Show in tab name only number, name and +- sign
set guitablabel=\[%N\]\ %t\ %M

" Indentation according AIMTech codestyle
set cino=N-s,g0,+2s,l-s,i2s

" Persistent current directory
set autochdir

" Highlight long lines
set colorcolumn=101

" Shortcuts for next and previous buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" YCM options.
nnoremap <C-g> :YcmCompleter GoToImprecise<CR>
nnoremap <C-u> :YcmCompleter GoToReferences<CR>
set completeopt-=preview " Don't show function/variable preview on the top
let g:ycm_confirm_extra_conf=0 " Hide notification about found .ycm_extra_conf.py
let g:ycm_goto_buffer_command='new-tab' " Go to in new tab
