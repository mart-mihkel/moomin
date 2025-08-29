let mapleader=" "
let g:netrw_banner=0
set clipboard+=unnamedplus
set complete=.,w,b,u,t
set backupdir=~/.vim
set directory=~/.vim
set viminfofile=NONE
set undodir=~/.vim
set encoding=utf-8
set colorcolumn=80
set relativenumber
set nocompatible
set shiftwidth=4
set scrolloff=4
set autoindent
set copyindent
set ignorecase
set noswapfile
set cursorline
set expandtab
set smartcase
set incsearch
set smarttab
set undofile
set showmode
set path+=**
set showcmd
set number
set nowrap
set hidden
set ruler
set list

syntax on
filetype plugin on
colorscheme habamax

nnoremap <space> <nop>
nnoremap <leader>gf :%s/\s\+$//e<CR>
nnoremap Y y$
nnoremap D d$
