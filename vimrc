"--------------- Options --------------
set number
set clipboard=unnamed
set showmode
set hlsearch
set incsearch
set smartcase
set scrolloff=8
set autoindent
set autowrite
set nowrap
syntax on 

" Tabing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab  

"--------------- Keymaps --------------
set noesckeys 
set backspace=indent,eol,start
let mapleader=" "
inoremap jk <ESC>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <silent> <esc> :noh<cr>
nnoremap <leader>e :Lexplore<cr>
vnoremap < <gv
vnoremap > >gv

"--------------- Style --------------
" Use a line cursor within insert mode and a block cursor everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
