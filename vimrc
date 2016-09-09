" line numbers {{{1
set number         " show line numbers
set relativenumber " relative line numbers make jumps/yanks/dels easier
" misc {{{1
set nobackup
set noswapfile
let mapleader=","           " my leader is a comma
syntax enable               " syntax highlighting
set autowrite               " autosave
set wrap                    " wrap lines
set visualbell              " no beeps
set noerrorbells            " no beeps
set fileformat=unix         " line endings
set fileformats=unix        " line endings
set hidden                  " hide buffers
set list                    " list mode enables use of listchars
set listchars=tab:▸\ ,eol:¬ " show tabs and eol
" folds {{{1
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " disable fold by default
" searching {{{1
set incsearch  " incremental searching
set hlsearch   " highlight found
set ignorecase " case insensitive ...
set smartcase  " ... unless capitalized
""" remove highlighting:
nnoremap <silent> <Leader>/ :noh<CR>
" blank lines {{{1
""" insert blank lines above or below
nnoremap <Leader>o mao<Esc>`a
nnoremap <Leader>O maO<Esc>`a
" random shortcuts {{{1
"""quicker command mode:
nnoremap <Space> :
"""quicker access to q register:
nnoremap Q @q
"""quicker write:
nnoremap <Leader>w :w<cr>
"""quicker quit:
nnoremap <Leader>q :q<cr>
"""split terminal:
nnoremap <Leader>t :sp term://zsh<cr>
"""vimrc:
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" tabs {{{1
set softtabstop=2 shiftwidth=2 expandtab
" splits {{{1
set splitbelow
set splitright
" navigation {{{1
" windows {{{2
""" skip the c-w
""" FIXME why does this not work h to l?
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" neovim terminal keybinding {{{2
""" make term nav be like window nav
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" tabs {{{2
nnoremap tc :tabnew<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
" plugins {{{1
" plug {{{2
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
" ctrlp {{{2
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" nerdtree {{{2
nnoremap <Leader>n :NERDTreeToggle<cr>
" colors {{{1
set background=dark
let g:airline_theme='kalisi'
colorscheme kalisi
" }}} vim: fdm=marker
