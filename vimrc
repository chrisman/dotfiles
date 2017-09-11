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

" incremental live sub!
" requires NVIM v0.1.7
set inccommand=split

" highlight found
set hlsearch

" case insensitive
set ignorecase
" ...unless capitalized
set smartcase

" global replace by default
set gdefault

" RANDOM LEADER SHORTCUTS {{{1
""""""""""""""""""""""""""""""

" change leader to comma
let mapleader=","

" remove highlighting:
nnoremap <silent> <Leader>/ :noh<CR>

" buffers
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader><Leader> :CtrlPBuffer<CR>
nnoremap <Leader>b :bn<CR>
nnoremap <Leader>B :bN<CR>
nnoremap <Leader>v <C-^> " C-^ is a contender for Most Uncomfortable Key Sequence

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
"edit vimrc/source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Explorer
nnoremap <Leader>n :NERDTreeToggle<CR>

" insert blank lines above or below
nnoremap <Leader>o mao<Esc>`a
nnoremap <Leader>O maO<Esc>`a

" I find myself repeating this a lot when editing JSON
" Visual line select to matching bracket, delete it
nnoremap <Leader>d V%d

" TABS {{{1
"""""""""""

set tabstop=2     " tabs are two spaces long. the default is 8?? what is wrong with you
set softtabstop=2 " typing <TAB> inserts two spaces
set shiftwidth=2  " autoindent spaces, i.e. `<<` and `>>`
set expandtab     " use the right no. of spaces in Insert mode

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
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"" neovim terminal keybinding {{{2
""""""""""""""""""""""""""""""""""

"" make term nav be like window nav
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" PLUGINS {{{1
""""""""""""""
"" plug {{{2
""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'freeo/vim-kalisi'
Plug 'vim-airline/vim-airline'                                     " looks and feels
Plug 'vim-airline/vim-airline-themes'                              " looks and feels
Plug 'gorodinskiy/vim-coloresque'                                  " CSS colors!
Plug 'ctrlpvim/ctrlp.vim'                                          " fuzzy search
Plug 'tpope/vim-surround'                                          " surround
Plug 'godlygeek/tabular'                                           " columns
Plug 'mattn/emmet-vim'                                             " html expander
Plug 'neomake/neomake'                                             " async make
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }      " completion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }   " deoplete for js
Plug 'fishbullet/deoplete-ruby'                                    " deoplete for roobie
Plug 'SirVer/ultisnips'                                            " snippets
Plug 'honza/vim-snippets'                                          " starter snippets
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'nono/vim-handlebars'
Plug 'slim-template/vim-slim'                                      " slim (rails template)
Plug 'elmcast/elm-vim', { 'for': 'elm' }                           " elm support
Plug 'pbogut/deoplete-elm'                                         " elm support
Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'typescript'] } " typescript support
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'                                          " git
Plug 'airblade/vim-gitgutter'                                      " git
Plug 'posva/vim-vue', { 'for': 'vue'}                              " vuuuuuuuue
call plug#end()

"" elm {{{2
"""""""""""
let g:elm_format_autosave = 1
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
"" airline {{{2
"""""""""""""""
let g:airline#extensions#tabline#enabled = 1 " show buffers
"" deoplete {{{2
""""""""""""""""
let g:deoplete#enable_at_startup = 1
"" ultisnips {{{2
"""""""""""""""""
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=$HOME.'/.vim/UltiSnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"" ctrlp {{{2
"""""""""""""
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|.git|.bak|.swp|.pyc|.class'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 18
" COLORS {{{1
"""""""""""""
set background=dark
" powerline fonts don't work good :(
" keep em disabled for now
let g:airline_powerline_fonts = 0
let g:airline_theme='kalisi'
colorscheme kalisi
" }}} vim: fdm=marker
