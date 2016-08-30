"" line numbers
set number
set relativenumber

"" misc
let mapleader=","
set title
set wrap
set visualbell
set noerrorbells
syntax enable
set fileformat=unix
set fileformats=unix
set hidden

"" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <Leader>/ :noh<CR>

"" autosave
:set autowrite

"" blank lines
nnoremap <Leader>o mao<Esc>`a
nnoremap <Leader>O maO<Esc>`a

"" random shortcuts
nnoremap <Space> :
nnoremap Q @q
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>t :sp term://zsh<cr>
nnoremap <leader>ev :e 

"" tabs
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set softtabstop=2 shiftwidth=2 expandtab

"" splits
set splitbelow
set splitright

"" NAVIGATION
nnoremap j gj
nnoremap k gk
" windows
" FIXME why does this not work h to l?
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" neovim terminal keybinding
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
"" tabs, the other kind
nnoremap tc :tabnew<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"" PLUGS
call plug#begin('~/.vim/plugged')
Plug 'freeo/vim-kalisi'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'typescript'] }
Plug 'godlygeek/tabular'
call plug#end()

"" colors
set background=dark
let g:airline_theme='kalisi'
colorscheme kalisi

"" ctrlp
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>
