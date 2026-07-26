set wrap
set clipboard=unnamedplus
set number
set relativenumber
set splitbelow
set undofile
set list

set tabstop=4
set shiftwidth=4
set expandtab

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

tnoremap <Esc> <C-\><C-n>

command! So execute "normal :source $MYVIMRC\<CR>"

" Make c not yank
nnoremap c "_c
xnoremap c "_c

let g:compile_mode = {}
nnoremap [e :PrevError<CR>
nnoremap ]e :NextError<CR>

nnoremap <leader>r :w<CR>:Recompile<CR>:sleep 200m<CR>:NextError<CR>
