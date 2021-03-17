let mapleader="\<Space>"

set background=dark
set backspace=indent,eol,start
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
set linebreak
set number
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set smartcase
set statusline=%f%m\ %y%=%v:%l/%L\ %P
set t_Co=256
set tabstop=2
set termguicolors
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
nnoremap <C-I> :Rg 
nnoremap <C-P> :Files<CR>
nnoremap <F3> :set list!<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>sh :leftabove  vnew<CR>
nnoremap <Leader>sj :rightbelow new<CR>
nnoremap <Leader>sk :leftabove  new<CR>
nnoremap <Leader>sl :rightbelow vnew<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Space> <Space>:noh<CR>
nnoremap j gj
nnoremap k gk
noremap <Leader>t :tabnew<CR>
noremap <Leader>tc :tabclose<CR>
noremap <Leader>te :tabedit
noremap <Leader>tn :tabnext<CR>
noremap <Leader>tp :tabprevious<CR>

match ErrorMsg '\s\+$'

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'evanleck/vim-svelte'
Plug 'habamax/vim-asciidoctor'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
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

colorscheme gruvbox
