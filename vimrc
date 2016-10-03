" MISC/GENERAL {{{1
"""""""""""""""""""

" relative line numbers make jumps/yanks/dels easier
" show line numbers
set relativenumber number

" I use git for backups. No swap files pls
set nobackup
set noswapfile

" autoreload changed files with no local changed
" (no more :e! all the time)
set autoread

" syntax highlighting
syntax enable

" wrap lines
set wrap

" no beeps
set visualbell
set noerrorbells

" line endings
set fileformat=unix
set fileformats=unix

" hide buffers instead of closing them
set hidden
" write on jump
set autowrite

" list mode enables use of listchars
set list
" show tabs and eol
set listchars=tab:▸\ ,eol:¬

" FOLDS {{{1
""""""""""""

" fold based on indent
set foldmethod=indent

" deepest fold is 10 levels
set foldnestmax=10

" disable fold by default
"set nofoldenable

" SEARCHING {{{1
""""""""""""""""

" incremental searching
set incsearch

" highlight found
set hlsearch

" case insensitive
set ignorecase
" ...unless capitalized
set smartcase

" remove highlighting:
nnoremap <silent> <Leader>/ :noh<CR>

" RANDOM LEADER SHORTCUTS {{{1
""""""""""""""""""""""""""""""

" change leader to comma
let mapleader=","

"quicker command mode:
nnoremap <Space> :

"quicker access to q register:
nnoremap Q @q

" write and quit
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

"split terminal, enter insert mode:
nnoremap <Leader>t :sp term://zsh<cr>i
"
"edit/source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"
" insert blank lines above or below
nnoremap <Leader>o mao<Esc>`a
nnoremap <Leader>O maO<Esc>`a

" TABS {{{1
"""""""""""

set softtabstop=2 shiftwidth=2 expandtab

" SPLITS {{{1
"""""""""""""

" open splits below
set splitbelow

" open vsplits to the right
set splitright

" NAVIGATION {{{1
"""""""""""""""""

"" windows {{{2
"""""""""""""""

"" skip the c-w
"" FIXME why does this not work h to l?
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

"" neovim terminal keybinding {{{2
""""""""""""""""""""""""""""""""""

"" make term nav be like window nav
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"" tabs {{{2
"""""""""""
nnoremap tc :tabnew<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" PLUGINS {{{1
""""""""""""""

"" neomake {{{2
"""""""""""""""
let g:neomake_warning_sign = {
\ 'text': '✗',
\ 'texthl': 'ErrorMsg',
\ }

let g:neomake_error_sign = {
\ 'text': '⚠',
\ 'texthl': 'ErrorMsg',
\ }

"" plug {{{2
""""""""""""

call plug#begin('~/.vim/plugged')
" looks and feels
Plug 'freeo/vim-kalisi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" file browser
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround' " surround
Plug 'godlygeek/tabular' " columns
Plug 'gorodinskiy/vim-coloresque' " CSS colors!
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'typescript'] }
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.nvim'
" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
call plug#end()

"" ctrlp {{{2
"""""""""""""

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>

"" nerdtree {{{2
""""""""""""""""
nnoremap <Leader>n :NERDTreeToggle<cr>


" COLORS {{{1
"""""""""""""
set background=dark
let g:airline_theme='kalisi'
colorscheme kalisi
" }}} vim: fdm=marker
