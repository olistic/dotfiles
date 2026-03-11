" Use the OS clipboard
set clipboard=unnamed

" Change mapleader
let mapleader=","

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Line numbers (relative + absolute current)
set number
set relativenumber

" Syntax highlighting
syntax on
set cursorline

" Tabs as two spaces
set tabstop=2

" Case-insensitive search unless uppercase is used
set ignorecase
set smartcase

" Show trailing whitespace
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Don't show the intro message
set shortmess=atI

" Show the filename in the window titlebar
set title

" Start scrolling three lines before the border
set scrolloff=3
