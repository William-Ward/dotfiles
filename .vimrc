set number relativenumber " gives me the cool line numbers
set expandtab             " expands tabs to space
set smarttab              " makes the automatic tabs
"set scl=no                " force the signcolumn to disappear

"set spell spelllang=en_us

set shiftwidth=2          "don't know what this one does
set tabstop=4             "don't know what this one does
set autoindent            "don't know what this one does

syntax enable

" set cursorline 
set nocompatible
filetype off


filetype plugin indent on 

set shell=/bin/bash 

"---remaps--------------------------------------------------------"

inoremap jk <ESC>
nnoremap <C-u> <C-y>

"---Plugins-------------------------------------------------------"

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugIntsall --sync | source $MYVIMRC
"endif
call plug#begin('~/.vim/plugged')

" Plug 'vimwiki/vimwiki' 
" Plug 'scrooloose/nerdtree'
" Plug 'valloric/youcompleteme'
" Plug 'vim-scripts/Conque-GDB'

call plug#end()

"---text templates---
"creates a basic for loop template
autocmd Filetype cpp inoremap for for(int i = 0; i < size; i++)<Enter>{<Enter><Enter>}<ESC>kcc
"creates a basic c++ template
autocmd Filetype cpp inoremap gN #include <iostream><Enter><Enter>using namespace std;<Enter><Enter>int main()<Enter>{<Enter><Enter>return 0;<Enter>}<ESC>kkcc

noremap + :s/^/\/\//<CR>
noremap - :s/^\/\///<CR>
