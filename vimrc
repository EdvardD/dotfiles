" Use Vim settings, rather than Vi settings.
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
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

" Open vertical split on the right side from current buffer
set splitright
" Open horizontal split on below current buffer
set splitbelow

" Permit switch from unsaved buffer
set hidden

" Navigate over tabs
noremap <S-Tab> gT
noremap <Tab> gt

" Close file by ctrl-q
nnoremap <C-q> :q<CR>
nnoremap <C-u> :bd<CR>

" Inverse color for selecting
hi Visual ctermfg=none ctermbg=none cterm=inverse

" Ignore case during a search
set ignorecase

" Override the 'ignorecase' if the search pattern contains upper case characters
set smartcase

" Highlight occurences of a search
set hlsearch

" Compiling by F7, running by F9
nmap <F7> :w<CR>:!clang++ -Wno-deprecated -Wno-deprecated-declarations -Wall -Wextra -Wconversion -lm -x c++ -DSU1 -O2 -pthread -std=c++17 -o %:r %<CR>
nmap <F8> :w<CR>:!rustc %<CR>
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

" Copy from cursor position to the end of line
nnoremap Y y$

" Delete trailing white spaces after each write
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.* :call DeleteTrailingWS()

" Load previous session. Only available when compiled with the +viminfo feature
set viminfo='10,\"100,:20,%,n~/.viminfo
" Set cursor to its last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Smart indentation
set cino=N-s,g0,+2s,l-s,i2s

" Highlight long lines
set colorcolumn=101

" Shortcuts for next and previous buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

colorscheme molokai

" NERDTree settings
nnoremap <Bs> :<C-u>NERDTreeToggle<CR>
" Hide NERD on each open
let NERDTreeQuitOnOpen=1
" Show hidden files
let NERDTreeShowHidden=1
" Disable display of the 'Bookmarks' label and 'Press ? for help' text
let NERDTreeMinimalUI=1

" Vim-go settings.
let g:go_fmt_command = "goimports"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:neocomplete#enable_at_startup = 1

" FZF
nnoremap ; :Buffers<CR>
nnoremap , :Files<CR>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" YCM options.
nnoremap <C-g> :YcmCompleter GoToDeclaration<CR>
set completeopt-=preview " Don't show function/variable preview on the top
let g:ycm_confirm_extra_conf=0 " Hide notification about found .ycm_extra_conf.py
let g:ycm_goto_buffer_command='new-tab'
