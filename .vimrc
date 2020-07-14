colorscheme solarized

let mapleader="\<Space>"

set backspace=indent,eol,start
set bg=dark
set colorcolumn=81
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
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set smartcase
set t_Co=256
set tabstop=2
set visualbell
set wrap
syntax on

cnoremap jk <Esc>
inoremap jk <C-[>
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
map <Leader>t :tabnew<CR>
map <Leader>tc :tabclose<CR>
map <Leader>te :tabedit
map <Leader>tn :tabnext<CR>
map <Leader>tp :tabprevious<CR>
nmap <Leader>sh :leftabove  vnew<CR>
nmap <Leader>sj :rightbelow new<CR>
nmap <Leader>sk :leftabove  new<CR>
nmap <Leader>sl :rightbelow vnew<CR>
nmap <Leader>w :w!<CR>
nmap <Space> <Space>:noh<CR>
nnoremap <C-I> :Rg 
nnoremap <C-P> :Files<CR>
nnoremap <F3> :set list!<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>

match ErrorMsg '\s\+$'

call plug#begin('~/.vim/plugged')
" Plugin 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

let g:ale_fix_on_save=1
let g:ale_lint_delay=1000
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'

function! s:check_back_space() abort " Used by coc-vim
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
