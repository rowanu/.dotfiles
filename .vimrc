set nocompatible " Vi, IMprove thyself
"set directory=~/.vim/tmp/,.  " Keep swap files in one location
highlight clear SignColumn " Make gitgutter's column look nicer
set backspace=indent,eol,start " Intuitive backspacing
set cursorcolumn
set cursorline
set expandtab " Use spaces instead of tabs
set foldenable " Folding is good
set foldlevelstart=1
set foldnestmax=10 " ...lots of folding
set hidden " Handle multiple buffers better
set history=1000
set hlsearch " Highlight matches
set ignorecase " Case-insensitive searching
set incsearch " Highlight matches as you type
set laststatus=2 " Show the status line all the time
set lazyredraw " Only update if needed i.e. during macros
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nobackup " Don't make a backup before overwriting a file
set nowritebackup " And again
set number " Show the absolute number of the selected line
set pastetoggle=<F2>
set relativenumber " Display relative line numbers
set ruler " Show cursor position
set scrolloff=5 " Show n lines of context around the cursor
set shiftwidth=2 " And again, related.
set showcmd " Display incomplete commands
set showmatch " Display the closing match eg. ()
set showmode " Display the mode you're in
set smartcase " ...but case-sensitive if contains a capital letter
set synmaxcol=240 " Highlighting really long lines is SLOW
set t_Co=256 " Terminal colours available
set tabstop=2 " Global tab width.
set title " Set the terminal's title
set visualbell " No beeping
set wildignore+=*/bower_components/*,*/node_modules/*,*/.tmp/*,*/dist/*,*.pyc
set wildmenu " Enhanced command line completion
set wildmode=list:longest " Complete files like a shell
set wrap " Turn on line wrapping
" Highlight long lines
set textwidth=80
set colorcolumn=+1
" Highlight trailing whitespace
match ErrorMsg '\s\+$'
" The Esc key is not your friend
cnoremap jk <Esc>
inoremap jk <C-[>
set background=light
colorscheme solarized
packadd! matchit
" " Jump to column of marking by default
" nnoremap ' `
" nnoremap ` '

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Calls indent on and syntax enable
Plug 'alvan/vim-closetag'
Plug 'davidhalter/jedi-vim'
Plug 'Konfekt/FastFold'
Plug 'maralla/completor.vim', {'do': 'cd pythonx/completers/javascript && npm install'}
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" ## Filetype Configurations
autocmd BufNewFile,BufRead *.md,*.markdown setlocal spell
autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=0 wrapmargin=0
autocmd BufNewFile,BufRead *.template setlocal filetype=cloudformation foldmethod=indent syntax=yaml commentstring=#\ %s
autocmd BufNewFile,BufRead *.svelte setlocal filetype=html
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal foldmethod=syntax shiftwidth=2 tabstop=2
autocmd FileType python setlocal foldmethod=indent shiftwidth=4 tabstop=4
autocmd FileType go setlocal foldmethod=indent shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal foldmethod=indent
autocmd FileType json setlocal foldmethod=indent

" Relative/Absolute line numbers
autocmd InsertEnter * :set relativenumber!
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd InsertLeave * :set number!
" ## Mappings
let mapleader="\<Space>"
let g:mapleader="\<Space>"
nnoremap <F3> :set list!<CR>
" ### Tab mappings
map <leader>t :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
" Split window
nmap <leader>swh :topleft  vnew<cr>
nmap <leader>swl :botright vnew<cr>
nmap <leader>swk :topleft  new<cr>
nmap <leader>swj :botright new<cr>
" Split buffer
nmap <leader>sh :leftabove  vnew<cr>
nmap <leader>sl :rightbelow vnew<cr>
nmap <leader>sk :leftabove  new<cr>
nmap <leader>sj :rightbelow new<cr>
" Quick save
nmap <leader>w :w!<cr>
" clear highlighting
nmap <space> <space>:noh<cr>

" ### CtrlP
let g:ctrlp_switch_buffer=0 " Open buffer again, don't jump
let g:ctrlp_max_files=1000 " Limit number of files scanned
" ### Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_normal_green=1
" ### Ale
let g:ale_sign_error='✗'
let g:ale_sign_warning='⚠'
let g:ale_lint_delay=1000
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let b:ale_linter_aliases = ['cloudformation', 'yaml']
let g:ale_fixers = {
      \   'vue': ['prettier'],
      \   'javascript': ['prettier'],
      \   'css': ['prettier'],
      \   'python': ['black'],
      \}
" Only run on save
let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
" Golang
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_fields=1
let g:go_highlight_types=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command='goimports' " Auto-add imports
" Python
let g:jedi#use_splits_not_buffers = "left"
" Completor
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" Ack
let g:ackprg='ag --vimgrep --smart-case' " Use ag
cnoreabbrev ag Ack
nmap <leader>a :Ack 
