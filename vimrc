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

" list mode enables use of listchars
set list
" show tabs and eol
set listchars=tab:▸\ ,eol:¬

" highlight current line plz
set cursorline

" filetypes
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.fnl set filetype=fennel

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

" Fuzzy stuff
nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Ag<Cr>
nnoremap <silent><leader>f :Buffers<Cr>

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

"split terminal, enter insert mode:
nnoremap <Leader>t :sp term://zsh<cr>i
"
"edit vimrc/source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Explorer
nnoremap <Leader>n :NERDTreeToggle<CR>

" TABS {{{1
"""""""""""

set tabstop=2     " tabs are two spaces long. the default is 8?? what is wrong with you
set softtabstop=2 " typing <TAB> inserts two spaces
set shiftwidth=2  " autoindent spaces, i.e. `<<` and `>>`
set expandtab     " use the right no. of spaces in Insert mode

" SNIPPETS {{{1
"""""""""""""""

" Use <C-y> for trigger snippet expand.
imap <C-y> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>y for convert visual selected code to snippet
xmap <leader>y  <Plug>(coc-convert-snippet)

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " conquerer of completion
Plug 'freeo/vim-kalisi'                                           " looks and feels: colorscheme
Plug 'szw/vim-maximizer'                                          " maximizer
Plug 'honza/vim-snippets'                                         " snippets
Plug 'vim-airline/vim-airline'                                    " looks and feels
Plug 'vim-airline/vim-airline-themes'                             " looks and feels
Plug 'gko/vim-coloresque'                                         " CSS colors!
Plug 'tpope/vim-surround'                                         " surround
Plug 'godlygeek/tabular'                                          " columns
Plug 'mattn/emmet-vim', { 'for': 'html' }                         " html expander
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
Plug 'junegunn/goyo.vim'                                          " distraction free markdown
Plug 'reedes/vim-pencil'                                          " distraction free markdown
Plug 'junegunn/limelight.vim'                                     " distraction free markdown
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " actual vim in the browser
Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }                   " hello fennel
Plug 'vim-scripts/paredit.vim', { 'for': 'fennel' }               " for some lispy lisps
Plug 'vimwiki/vimwiki'                                            " vimwiki
Plug 'HerringtonDarkholme/yats.vim'                               " typescript syntax
call plug#end()

"" paredit {{{2
"""""""""""""""
au FileType fennel call PareditInitBuffer()
"" vimwiki {{{2
"""""""""""""""
let g:vimwiki_global_ext = 0
let g:vimwiki_listsyms = '✗○◐●✓'

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
"" goyo family {{{2
"""""""""""""""""""
"" why is the goyo family so hard to get right??
nnoremap <leader>m :Goyo<cr>
autocmd FileType markdown Goyo
let g:pencil#wrapModeDefault = 'soft'
let g:limelight_default_coefficient = 0.7
function! s:goyo_enter()
  " quit on :q
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  " hide tmux
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " other plugins
  Limelight
  TogglePencil
  SoftPencil
  silent CocDisable
endfunction
function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
  " bring back tmux
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " turn off plugins
  Limelight!
  NoPencil
  CocEnable
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" COLORS {{{1
"""""""""""""
set background=dark
" powerline fonts don't work good :(
" keep em disabled for now
let g:airline_powerline_fonts = 0
let g:airline_theme='kalisi'
colorscheme kalisi
" }}} vim: fdm=marker
