" MISC/GENERAL {{{1
"""""""""""""""""""

" relative line numbers make jumps/yanks/dels easier
" show line numbers
set relativenumber number

" set file encoding
set fileencodings=utf-8

" I use git for backups. No swap files pls
set nobackup
set noswapfile

" autoreload changed files with no local changed
" (no more :e! all the time)
set autoread

" syntax highlighting
syntax enable

" wrap lines without breaking words
set wrap linebreak

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

"" list mode enables use of listchars
"set list
"" show tabs and eol
"set listchars=tab:▸\ ,eol:¬

" highlight current line plz
set cursorline

" filetypes
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.fnl set filetype=fennel
autocmd BufNewFile,BufRead *.astro set filetype=html

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

" silver searcher please
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" Fuzzy stuff
nnoremap <C-p> :GFiles<Cr>
nnoremap <M-p> :Buffers<Cr>
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Ag<Cr>

" RANDOM LEADER SHORTCUTS {{{1
""""""""""""""""""""""""""""""

" change leader to comma
let mapleader=","
let maplocalleader=";"

" toggle spell check
nnoremap <Leader>s :setlocal spell! spelllang=en_us<CR>

" open in eXternal application
" eXecute file?
" handy for viewing markdown in external viewer for example. Or HTML in a
" browser.
nnoremap <Leader>x :silent !open %<CR>

" remove highlighting:
nnoremap <silent> <Leader>/ :noh<CR>

" buffers
nnoremap <Leader>b :bn<CR>   " next buffer
nnoremap <Leader>B :bN<CR>   " prev buffer
nnoremap <Leader>v <C-^>     " Last buffer. C-^ is a contender for Most Uncomfortable Key Sequence Ever

" maximizer
nnoremap <Leader>z :MaximizerToggle<CR>

"quicker command mode:
nnoremap <Space> :

"quicker access to q register:
nnoremap Q @q

" write and quit
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>

" split terminal, enter insert mode:
nnoremap <Leader>t :sp term://zsh<cr>i
" autoclose terminal (no "process exited n")
autocmd TermClose * :q
"
"edit vimrc/source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Explorer
nnoremap <Leader>n :NERDTreeToggle<CR>

" Timestamp
inoremap ,f =strftime('%F')<CR>

" open files
nmap gf :e <cfile><CR>

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

" Move lines up and down a la Atom.
noremap <M-k> :m-2<CR>==
noremap <M-j> :m+1<CR>==

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
"" PLUGS {{{2
""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'freeo/vim-kalisi'                                           " looks and feels: colorscheme
Plug 'SirVer/ultisnips'                                           " snippets
Plug 'honza/vim-snippets'                                         " snippets
Plug 'gko/vim-coloresque'                                         " CSS colors!
Plug 'tpope/vim-surround'                                         " surround
Plug 'godlygeek/tabular'                                          " columns
Plug 'mattn/emmet-vim', { 'for': ['html','astro'] }               " html expander
Plug 'scrooloose/nerdtree'                                        " file browser
Plug 'Xuyuanp/nerdtree-git-plugin'                                " file browser (w. git)
Plug 'tpope/vim-fugitive'                                         " git
Plug 'airblade/vim-gitgutter'                                     " git
Plug 'posva/vim-vue', { 'for': 'vue'}                             " vuuuuuuuue
Plug 'editorconfig/editorconfig-vim'                              " http://editorconfig.org
Plug 'easymotion/vim-easymotion'                                  " easy `avy word` style jumping
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }             " elixir
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }               " fuzzy find
Plug 'junegunn/fzf.vim'                                           " fuzzy find
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " actual vim in the browser
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }                   " hello fennel
Plug 'vim-scripts/paredit.vim', { 'for': 'fennel' }               " for some lispy lisps
Plug 'vimwiki/vimwiki'                                            " vimwiki
Plug 'zaid/vim-rec'                                               " recutils lol
Plug 'NoahTheDuke/vim-just'                                       " just!
Plug 'andys8/vim-elm-syntax', { 'for': 'elm' }                    " elm
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }                   " svelte
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/vim-markdown'                                     " I want TOC in markdown
Plug '~/sandbox/tbls/vim-tbls'
Plug '~/sandbox/vim-lil', { 'for': 'lil' }
Plug 'jparise/vim-graphql'

call plug#end()

"" lspconfig {{{2
"""""""""""""""""
lua require'lspconfig'.fennel_ls.setup{}
lua vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
lua vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
"" snippets {{{2
""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-y>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-tab>"
"" paredit {{{2
"""""""""""""""
au FileType fennel call PareditInitBuffer()
"" vimwiki {{{2
"""""""""""""""
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_folding = 'list'
let g:vimwiki_table_mappings = 0

let wiki1 = {}
let wiki1.name = 'knowledge'
let wiki1.path = '~/knowledge'
let wiki1.auto_toc = 1
let wiki1.auto_tags = 1
let wiki1.syntax = 'markdown'
let wiki1.ext = '.md'
let wiki1.index = 'Home'
let wiki1.custom_wiki2html = 'mdwiki2html'

let wiki2 = {}
let wiki2.name = 'game'
let wiki2.path = '~/Documents/strixhaven/'
let wiki2.auto_toc = 1
let wiki2.auto_tags = 1
let wiki2.path_html = '$HOME/blogs/dozens-and-dragons/out/campaign/'

let g:vimwiki_list = [ wiki1, wiki2 ]

"" firenvim {{{2
""""""""""""""""
if exists('g:started_by_firenvim')
  let g:airline#extensions#tabline#enabled = 0
  set laststatus=0
else
  let g:airline#extensions#tabline#enabled = 1 " show tabline
  set laststatus=1
endif
"" easymotion {{{2
""""""""""""""""""
let g:EasyMotion_smartcase = 1
"" fzf {{{2
"""""""""""
let $FZF_DEFAULT_COMMAND = 'ag -g ""'  " respec teh gitignore
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } " popout!
" COLORS {{{1
"""""""""""""
set background=dark
" powerline fonts don't work good :(
" keep em disabled for now
let g:airline_powerline_fonts = 0
let g:airline_theme='kalisi'
colorscheme kalisi
" NETRW {{{1
""""""""""""
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = './\.*'
" }}} vim: fdm=marker
