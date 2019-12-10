autocmd InsertEnter,InsertLeave * set cul! " changes bar in insert mode
let mapleader = ","
set number relativenumber " gives me the cool line numbers
set expandtab             " expands tabs to space
set smarttab              " makes the automatic tabs
set tag=tag               " needed for ctags
set scrolloff=3           " keep 3 lines when scrolling
"set scl=no                " force the signcolumn to disappear

"set spell spelllang=en_us "spell checker

set shiftwidth=4          "don't know what this one does
set tabstop=4             "don't know what this one does
set autoindent            "don't know what this one does

syntax enable

set foldmethod=marker     
set foldmarker=/*,*/      "folds all block comments

" set cursorline 
set nocompatible
filetype off


filetype plugin indent on 

set shell=/bin/bash 

"---remaps--------------------------------------------------------"

inoremap jk <ESC>:w<Cr>

" nnoremap <C-s> :wa<CR>
nnoremap <C-u> <C-y>

nnoremap <C-=> <C-w>=
nnoremap <C-<> <C-w><
nnoremap <C-_> <C-w>_
nnoremap <bar> <C-w><bar>

" nnoremap <C-w> <C-w><C-w>

nnoremap <C-left> <C-w>H
nnoremap <C-down> <C-w>J
nnoremap <C-up> <C-w>K
nnoremap <C-right> <C-w>L

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map <C-A> ggVG
"---Plugins-------------------------------------------------------"

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugIntsall --sync | source $MYVIMRC
"endif
call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki' 
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
" Plug 'vim-scripts/Conque-GDB'

call plug#end()

"---text templates---

"creates a basic for loop template
autocmd Filetype cpp imap <Leader>for for(int i = 0; i < size; i++)<CR>{<CR><CR>}<ESC>kcc
"creates a basic c++ template
autocmd Filetype cpp imap <Leader>gn #include <iostream><CR><CR>using namespace std;<CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}<ESC>kkcc 
" creates template if statement
autocmd Filetype cpp imap <Leader>if if()<CR>{<CR><CR>}<ESC>3kf)i
" creates template #include statement
autocmd Filetype cpp imap <Leader>i #include < ><ESC>hs

" this is because my fat fingers can't type q!
abbr Q q!

" does the opposite of J
map K O<ESC>
" toggles comments
noremap + :s/^/\/\//<CR> 
noremap - :s/^\/\///<CR>
