" ==> General settings {{{
let mapleader = " "
syntax enable
syntax on

" set colorcolumn to 80 characters and dark grey
" set colorcolumn=80
" highlight ColorColumn ctermbg=darkgrey

set incsearch " show the search results as you type
set nowrap    " don't wrap long lines

" autocmd InsertEnter,InsertLeave * set cul! " changes bar in insert mode 

set number relativenumber " gives me the cool line numbers
set tag=tag               " needed for ctags
set scrolloff=0           " keep 3 lines when scrolling
set scl=no                " force the signcolumn to disappear

set shiftwidth=4          "don't know what this one does
set autoindent            "auto indents supported files
set tabstop=4             "sets tabs to 4 spaces
set expandtab             "converts tabs to space
set smarttab              "makes the automatic tabs


" set cursorline 
set nocompatible
filetype off

filetype plugin indent on 
filetype plugin on 
set omnifunc=syntaxcomplete#Complete

set shell=/usr/bin/zsh

"enable fuzzy finder
" :find now gives fuzzy search, tab to complete
set path+=**              

"Display all matching files when tab complete
" :b lets you auto complete any open buffer
set wildmenu              

" }}}

" ==> netrw settings {{{
" Tweaks for browsing with :Texplore
" using :edit then <CR>/v/t to open in h-split/v-split/tab
let g:netrw_banner=0
let g:netrw_browse_split=2  "Open in new vsplit
let g:netrw_altv=1  "open in prior window
let g:netrw_liststyle=3  "list style is treeview
let g:netrw_winsize=20  " netrw is always 25 col wide

let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap <Leader>t :Vexplore<cr>

" }}}  

"==> Remaps {{{
" tab key uses vims autocomplete
inoremap <Tab> <C-n>
inoremap <C-Space> <C-n>

nnoremap <C-s> <C-x>
nnoremap <BS> $

" let asdf=~/source/repos/dotfiles/init.vim

" source my vimrc
nnoremap <Leader>sv :source $MYVIMRC<cr> 
" open my vimrc in verticle split
nnoremap <Leader>v :vs ~/source/repos/dotfiles/init.vim<cr> 

" delete three lines
nnoremap d, 3dd

" exit insert mode
inoremap kj <ESC>l

"move up or down 10 lines
nnoremap gj 10j
nnoremap gk 10k
vnoremap gj 10j
vnoremap gk 10k

nnoremap <Leader>w :wa<CR>
nnoremap <Leader>q :wqa<CR>

nnoremap <Leader>m :!make<CR>
nnoremap <Leader>mc :!make clean<CR>
nnoremap <Leader>mt :!make tests<CR>
autocmd Filetype cpp nnoremap <Leader>rt :!make tests && ./tests<CR>
autocmd Filetype python nnoremap <Leader>rt :!pytest<CR>

nnoremap <M-;> <C-w>>
nnoremap <M-'> <C-w><
nnoremap <Leader>= <C-w>=
nnoremap <Leader>_ <C-w>_
nnoremap <Leader><bar> <C-w><bar>

" map leader hjkl to move windows around
nnoremap <Leader>k <C-w>K
nnoremap <Leader>j <C-w>J
nnoremap <Leader>h <C-w>H
nnoremap <Leader>l <C-w>L

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab right, left
nnoremap <Right>  gt
nnoremap <Left> gT

" move line up, down
nnoremap <Up> ddkP
nnoremap <Down> ddp

" move stuff around in visual block mode
vnoremap <Down> :m '>+1<CR>gv=gv
vnoremap <Up> :m '<-2<CR>gv=gv

" does the opposite of J
nnoremap K o<ESC>k

" turn of highlighting after searching
nnoremap <Leader>/ :noh<CR>
" }}}

"==> text templates {{{

"creates class template
autocmd Filetype cpp inoremap /gc #ifndef <C-r>%<ESC>Bg~Wf.r_byWo#define <ESC>poclass <C-r>%<ESC>0w~f.C{<CR>private:<CR>public:<CR>};<CR>#endif<ESC>kk
"creates a basic for loop template
autocmd Filetype cpp inoremap /for for(int i = 0; i < size; i++)<CR>{<CR><CR>}<ESC>kcc
"creates a basic c++ template
" :.-1read $HOME/.vim/.newcpp<CR>6jS
autocmd Filetype cpp inoremap /gn #include <iostream><CR><CR>using namespace std;<CR><CR>int main()<CR>{<CR><CR>return 0;<CR>}<ESC>kkS
" creates template if statement
autocmd Filetype cpp inoremap /if if()<CR>{<CR><CR>}<ESC>3kf)i
" creates template #include statement
autocmd Filetype cpp inoremap /wh while()<CR>{<CR><CR>}<ESC>3k%i

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
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'             " comment quickly gcc
Plug 'tpope/vim-fugitive'               " comment quickly gcc
Plug 'godlygeek/tabular'                " align text on a given character
Plug 'itchyny/lightline.vim'            " better statusline
Plug 'scrooloose/nerdtree'              " nerdtree
Plug 'morhetz/gruvbox'                  " colorscheme

Plug 'glts/vim-magnum'                  " integer library
Plug 'glts/vim-radical'                 " convert hex,bin,dec,oct
Plug 'tpope/vim-repeat'                 " repeat plugin commands

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" for c++ install clang
" for python install python-pylint and python-jedi

call plug#end()

colorscheme gruvbox
set background=dark

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" nmap <Plug>SpeedDatingFallbackUp   <Plug>(CtrlXA-CtrlA)
" nmap <Plug>SpeedDatingFallbackDown <Plug>(CtrlXA-CtrlX)

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>
"" }}}

""==> Word Processor {{{
func! WordProcessor()
    nnoremap j gj
    nnoremap k gk

    setlocal formatoptions=1
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    setlocal spell spelllang=en_us
    set thesaurus+=/home/bill/.config/nvim/thesaurus/mthesaur.txt
    set complete+=s

endfu
com! WP call WordProcessor()
" }}}
