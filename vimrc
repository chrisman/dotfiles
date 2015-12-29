"" misc
set relativenumber
set wrap
syntax enable

"" searching
:set incsearch
:set hlsearch

"" autosave
:au FocusLost * :wa

"" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
