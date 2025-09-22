let mapleader=' '
let g:netrw_banner=0
set viminfofile=~/.vim/info
set backupdir=~/.vim
set directory=~/.vim
set undodir=~/.vim
set encoding=utf-8
set relativenumber
set nocompatible
set scrolloff=4
set autoindent
set copyindent
set ignorecase
set noswapfile
set expandtab
set smartcase
set incsearch
set smarttab
set undofile
set path+=**
set number
set hidden

syntax on
filetype plugin on

nnoremap <space> <nop>
nnoremap <leader>gf :%s/\s\+$//e<CR>
nnoremap <leader>sf :find<space>
nnoremap Y y$
nnoremap D d$
