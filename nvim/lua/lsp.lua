local lspconfig = require('lspconfig')

lspconfig.clangd.setup {
  init_options = {
    fallbackFlags = { '--std=c23' }
  }
}

vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
