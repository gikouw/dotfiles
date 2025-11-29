set wrap
set undofile
set clipboard=unnamedplus
set number 
set relativenumber 
set shiftwidth=4

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

nnoremap <F5> :make -B<CR>

" Make d not yank
nnoremap d "_d
xnoremap d "_d
nnoremap c "_c
xnoremap c "_c
