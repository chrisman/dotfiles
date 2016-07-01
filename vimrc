"" line numbers
set number
set relativenumber

"" misc
set wrap
syntax enable

"" searching
:set incsearch
:set hlsearch

"" autosave
:set autowrite

"" tabs
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set softtabstop=2 shiftwidth=2 expandtab

"" splits
set splitbelow
set splitright

"" NAVIGATION
" windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" neovim terminal keybinding
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"" function keys!
" unhighlight
nnoremap <F3> :noh<CR><CR>

"" PLUGS
call plug#begin('~/.vim/plugged')
Plug 'freeo/vim-kalisi'
Plug 'scrooloose/nerdtree'
"Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'leafgarland/typescript-vim', { 'for': 'ts' }
call plug#end()

"" colors
set background=dark
let g:airline_theme='kalisi'
colorscheme kalisi
