"" misc
set relativenumber
set wrap
syntax enable

"" colors
"" https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
colorscheme onedark
set background=dark
"set term=screen-256color

"" searching
:set incsearch
:set hlsearch

"" autosave
:set autowrite

"" tabs
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set softtabstop=2 shiftwidth=2 expandtab


"" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"" function keys!
nnoremap <F3> :noh<CR><CR>

"" PLUGS
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

