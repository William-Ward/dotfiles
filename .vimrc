" ==> General settings {{{
let mapleader = "," 

set incsearch
set nowrap

"command! MakeTags !ctags -R .
"set tags=tags,./tags

highlight Search guibg='Purple' guifg='NONE'

autocmd InsertEnter,InsertLeave * set cul! " changes bar in insert mode 

set number relativenumber " gives me the cool line numbers
set tag=tag               " needed for ctags
set scrolloff=0           " keep 3 lines when scrolling
"set scl=no                " force the signcolumn to disappear

"set spell spelllang=en_us "spell checker

set shiftwidth=4          "don't know what this one does
set autoindent            "auto indents supported files
set tabstop=4             "sets tabs to 4 spaces
set expandtab             "expands tabs to space
set smarttab              "makes the automatic tabs

syntax enable

" set cursorline 
set nocompatible
filetype off

filetype plugin indent on 
filetype plugin on 

set shell=/bin/zsh

"enable fuzzy finder
" :find now gives fuzzy search, tab to complete
set path+=**              

"Display all matching files when tab complete
" :b lets you auto complete any open buffer
set wildmenu              

" Tweaks for browsing with :Texplore
" using :edit then <CR>/v/t to open in h-split/v-split/tab
let g:netrw_banner=0
let g:netrw_browse_split=4  "open in prior window
let g:netrw_altv=1  "open in prior window
let g:netrw_liststyle=3  "open in prior window
let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}

"==> Remaps {{{

nnoremap <BS> $
" source my vimrc
nnoremap <Leader>sv :source $MYVIMRC<cr>

" open my vimrc in verticle split
nnoremap <Leader>v :vs $MYVIMRC<cr>

" open my vimrc in verticle split
noremap <Leader>tv :tabe $MYVIMRC<cr>

" delete three lines
nnoremap d<Leader> 3dd
nnoremap 3dd <nop>

" exit insert mode
inoremap kj <ESC>l

"move up or down 10 lines
nnoremap gj 10j
nnoremap gk 10k
vnoremap gj 10j
vnoremap gk 10k

nnoremap <Space> :wa<CR>
nnoremap <C-m>   :!make<CR>

nnoremap <C-=> <C-w>=
nnoremap <C-,> <C-w><
nnoremap <C-.> <C-w>>
nnoremap <C-_> <C-w>_
nnoremap <bar> <C-w><bar>

" map leader hjkl to move windows around
nnoremap <Leader>k <C-w>K
nnoremap <Leader>j <C-w>J
nnoremap <Leader>h <C-w>H
nnoremap <Leader>l <C-w>L

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Right>  gt
nnoremap <Left> gT
nnoremap <Down> ddp
nnoremap <Up> ddkP

" move stuff around in visual block mode
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

" does the opposite of J
nnoremap K o<ESC>k

" turn of highlighting after searching
nnoremap <Leader>/ :noh<CR>
" }}}

"==> text templates {{{

"creates a basic for loop template
autocmd Filetype cpp inoremap <Leader>for for(int i = 0; i < size; i++)<CR>{<CR><CR>}<ESC>kcc
"creates a basic c++ template
" :.-1read $HOME/.vim/.newcpp<CR>6jS
autocmd Filetype cpp inoremap <Leader>gn #include <iostream><CR><CR>using namespace std;<CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}<ESC>kkS
" creates template if statement
autocmd Filetype cpp inoremap <Leader>if if()<CR>{<CR><CR>}<ESC>3kf)i
" creates template #include statement
autocmd Filetype cpp inoremap <Leader>i #include < ><ESC>hs

" this is because my fat fingers can't type q!
abbr Q q!  

" }}}

" ==> Vimscript file settings {{{
augroup filetype_cpp
    autocmd!
    autocmd Filetype cpp setlocal foldmethod=marker
    set foldmarker=/*,*/      "folds all block comments
augroup END

set foldmethod=marker
set foldmarker={{{,}}}

augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
    set foldmarker={{{,}}}
augroup END
" }}}

"==> Plugins {{{

"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugIntsall --sync | source $MYVIMRC
"endif
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'jalvesaq/nvim-r' 
Plug 'christoomey/vim-tmux-navigator' 

call plug#end()
" )))

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
