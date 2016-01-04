"" misc
set relativenumber
set wrap
syntax enable

"" colors
"" https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
colorscheme onedark
set term=screen-256color

"" searching
:set incsearch
:set hlsearch

"" autosave
:set autowrite

"" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
