" LUA {{{1
""""""""""

lua << EOF
vim.o.number = true               -- show line numbers
vim.o.relativenumber = true       -- relative line numbers make jumps/yanks/dels easier
vim.o.fileencodings = "utf-8"     -- set file encoding
vim.o.swapfile = false            -- I use git for backups. No swap files pls
vim.o.autoread = true             -- autoreload changed files with no local changed (no more :e! all the time)
vim.o.visualbell = true           -- no beeps
vim.o.errorbells = false          -- no beeps
vim.o.wrap = true                 -- wrap lines without breaking words
vim.o.linebreak = true            -- wrap lines without breaking words
vim.o.fileformat = "unix"         -- line endings
vim.o.fileformats = "unix"        -- line endings
vim.o.hidden = true               -- hide buffers instead of closing them
vim.o.autowrite = true            -- write on jump
-- vim.o.list = true                 -- list mode enables use of listchars
-- vim.o.listchars = "tab:▸\ ,eol:¬" -- show tabs and eol
vim.o.cursorline = true           -- highlight current line plz
vim.o.foldmethod = "indent"       -- fold based on indent
vim.o.foldnestmax = 10            -- deepest fold is 10 levels
-- vim.o.foldenable = false       -- disable fold by default
vim.o.incsearch = true            -- incremental searching
vim.o.inccommand = "split"        -- incremental live sub
vim.o.hlsearch = true             -- highlight found
vim.o.ignorecase = true           -- case insensitive
vim.o.smartcase = true            -- ...unless capitalized
vim.o.gdefault = true             -- global replace by default
vim.o.grepprg= "ag --vimgrep $*"  -- silver searcher please
vim.o.grepformat = "%f:%l:%c:%m"  -- silver searcher please
vim.o.tabstop = 2                 -- tabs are two spaces long. the default is 8?? what is wrong with you
vim.o.softtabstop = 2             -- typing <TAB> inserts two spaces
vim.o.shiftwidth = 2              -- autoindent spaces, i.e. `<<` and `>>`
vim.o.expandtab = true            -- use the right no. of spaces in Insert mode
vim.o.splitbelow = true           -- open splits below
vim.o.splitright = true           -- open vsplits to the right
vim.o.background = "dark"         -- set background color

vim.g.mapleader = ","             -- Set leader key to comma
vim.g.maplocalleader = ";"        -- Set local leader key to semicolon

vim.cmd("syntax enable")          -- syntax highlighting

-- Set filetype for astro files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.astro",
  command = "setfiletype html"
})

-- autoclose terminal (no "process exited n")
vim.api.nvim_create_autocmd({"TermClose"}, {
  pattern = "*",
  command = ":q"
})

-- SET KEY MAPPINGS
-- fzf
vim.api.nvim_set_keymap('n', '<C-p>'     , ':GFiles<CR>'                          , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-p>'     , ':Buffers<CR>'                         , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>'     , ':Files<CR>'                           , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>'     , ':Ag<CR>'                              , { noremap = true, silent = true })
-- random leader shortcuts
vim.api.nvim_set_keymap('n', '<Leader>s' , ':setlocal spell! spelllang=en_us<CR>' , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x' , ':silent !open %<CR>'                  , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>/' , ':noh<CR>'                             , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b' , ':bn<CR>'                              , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>B' , ':bN<CR>'                              , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v' , '<C-^>'                                , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w' , ':w<cr>'                               , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q' , ':q<cr>'                               , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t' , ':sp term://zsh<cr>i'                  , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>n' , ':NERDTreeToggle<CR>'                  , { noremap = true, silent = true })
-- quick macros
vim.api.nvim_set_keymap('n', '<Space>'   , ':'                                    , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q'         , '@q'                                   , { noremap = true, silent = true })
-- window nav
vim.api.nvim_set_keymap('n', '<C-j>'     , '<C-w><C-j>'                           , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>'     , '<C-w><C-k>'                           , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>'     , '<C-w><C-l>'                           , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>'     , '<C-w><C-h>'                           , { noremap = true, silent = true })
-- goto file
vim.api.nvim_set_keymap('n', 'gf'         , ':e <cfile><CR>'                      , { noremap = true, silent = true })
-- shift line
vim.api.nvim_set_keymap('n', '<M-k>'     , ':m-2<CR>=='                           , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-j>'     , ':m+1<CR>=='                           , { noremap = true, silent = true })
-- vimrc
vim.api.nvim_set_keymap('n', '<leader>ev' , ':e $MYVIMRC<CR>'                     , { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sv' , ':so $MYVIMRC<CR>'                    , { noremap = true, silent = true })
-- terminal nav
vim.api.nvim_set_keymap('t', '<Esc>'      , '<C-\\><C-n>'                         , { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-h>'      , '<C-\\><C-n><C-w>h'                   , { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>'      , '<C-\\><C-n><C-w>j'                   , { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>'      , '<C-\\><C-n><C-w>k'                   , { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>'      , '<C-\\><C-n><C-w>l'                   , { noremap = true, silent = true })
EOF


" PLUGINS {{{1
""""""""""""""
"" PLUGS {{{2
""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'freeo/vim-kalisi'                                           " looks and feels: colorscheme
Plug 'SirVer/ultisnips'                                           " snippets
Plug 'honza/vim-snippets'                                         " snippets
Plug 'gko/vim-coloresque', { 'for': ['css', 'scss', 'html' ] }    " CSS colors!
Plug 'tpope/vim-surround'                                         " surround
Plug 'godlygeek/tabular'                                          " columns
Plug 'mattn/emmet-vim', { 'for': ['html','astro'] }               " html expander
Plug 'scrooloose/nerdtree'                                        " file browser
Plug 'Xuyuanp/nerdtree-git-plugin'                                " file browser (w. git)
Plug 'tpope/vim-fugitive'                                         " git
Plug 'airblade/vim-gitgutter'                                     " git
Plug 'posva/vim-vue', { 'for': 'vue'}                             " vuuuuuuuue
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
Plug 'folke/zen-mode.nvim'
Plug 'preservim/vim-pencil'
Plug 'EdenEast/nightfox.nvim'                                     " *fox Colors
call plug#end()

"" lspconfig {{{2
"""""""""""""""""
lua<<EOF
require'lspconfig'.fennel_ls.setup{}
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
EOF

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
  set laststatus=0
else
  set laststatus=1
endif
"" easymotion {{{2
""""""""""""""""""
let g:EasyMotion_smartcase = 1
"" zen-mode {{{2
""""""""""""""""
nnoremap <Leader>m :ZenMode<CR>
"" pencil {{{2
""""""""""""""
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
"" fzf {{{2
"""""""""""
let $FZF_DEFAULT_COMMAND = 'ag -g ""'  " respec teh gitignore
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } } " popout!
" COLORS {{{1
"""""""""""""
lua vim.cmd("colorscheme duskfox")     -- colorscheme
" NETRW {{{1
""""""""""""
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = './\.*'
" }}} vim: fdm=marker
