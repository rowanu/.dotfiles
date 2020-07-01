colorscheme solarized

let mapleader="\<Space>"

set backspace=indent,eol,start
set bg=dark
set errorbells
set expandtab
set foldlevelstart=1
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set number
set shiftwidth=4
set showcmd
set smartcase
set t_Co=256
set tabstop=2
set visualbell
set wrap

syntax on

cnoremap jk <Esc>
inoremap jk <C-[>
nmap <space> <space>:noh<cr>

match ErrorMsg '\s\+$'

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
" Plugin 'vim-airline/vim-airline'
call plug#end()

let g:ale_fix_on_save=1
let g:ale_lint_delay=1000

