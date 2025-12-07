set wrap
set clipboard=unnamedplus
set number
set relativenumber
set shiftwidth=4
set splitbelow
set noundofile
set list

"set smartindent

set termguicolors
colorscheme sunbather
set background=dark
syntax on
hi Normal guibg=#161616

" Abbreviations
cabbrev W w
cabbrev Q q
cabbrev Q! q!
cabbrev Wq wq

" unmapping the Ex mode
nnoremap Q <Nop>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <leader>1 :sb 1<CR>
nnoremap <leader>2 :sb 2<CR>
nnoremap <leader>3 :sb 3<CR>
nnoremap <leader>4 :sb 4<CR>
nnoremap <leader>5 :sb 5<CR>
nnoremap <leader>6 :sb 6<CR>
nnoremap <leader>7 :sb 7<CR>
nnoremap <leader>8 :sb 8<CR>
nnoremap <leader>9 :sb 9<CR>
nnoremap <leader>e :sb term<CR>

nnoremap <F5> :!./run.sh<CR>

tnoremap <Esc> <C-\><C-n>

" TODO: handle the case when the file already exists 
command! Initrun execute "normal :new run.sh\<CR>:w\<CR>:silent !chmod +x run.sh\<CR>I#!/bin/sh\<Esc>o"
command! So execute "normal :source $MYVIMRC\<CR>"
command! Term execute "normal :new | term zsh\<CR>:file term\<CR>i\<CR>"

" Make c not yank
nnoremap c "_c
xnoremap c "_c
