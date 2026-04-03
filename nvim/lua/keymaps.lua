local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-p>', ':GFiles<CR>', opts)
map('n', '<M-p>', ':Buffers<CR>', opts)
map('n', '<C-f>', ':Files<CR>', opts)
map('n', '<C-g>', ':Ag<CR>', opts)

map('n', '<Leader>s', ':setlocal spell! spelllang=en_us<CR>', opts)
map('n', '<Leader>x', ':silent !open %<CR>', opts)
map('n', '<Leader>/', ':noh<CR>', opts)
map('n', '<Leader>b', ':bn<CR>', opts)
map('n', '<Leader>B', ':bN<CR>', opts)
map('n', '<Leader>v', '<C-^>', opts)
map('n', '<Leader>w', ':w<cr>', opts)
map('n', '<Leader>q', ':q<cr>', opts)
map('n', '<Leader>t', ':sp term://zsh<cr>i', opts)
map('n', '<Leader>n', ':NERDTreeToggle<CR>', opts)
map('n', '<Leader>m', ':ZenMode<CR>', opts)

map('n', '<Space>', ':', opts)
map('n', 'Q', '@q', opts)

map('n', '<C-j>', '<C-w><C-j>', opts)
map('n', '<C-k>', '<C-w><C-k>', opts)
map('n', '<C-l>', '<C-w><C-l>', opts)
map('n', '<C-h>', '<C-w><C-h>', opts)

map('n', 'gf', ':e <cfile><CR>', opts)

map('n', '<M-k>', ':m-2<CR>==', opts)
map('n', '<M-j>', ':m+1<CR>==', opts)

map('n', '<leader>ev', ':e $MYVIMRC<CR>', opts)
map('n', '<leader>sv', ':so $MYVIMRC<CR>', opts)

map('t', '<Esc>', '<C-\\><C-n>', opts)
map('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
