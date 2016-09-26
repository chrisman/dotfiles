" set eslint to make
setlocal makeprg=eslint\ -f\ compact\ %
" how to read eslint errors
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
" run make on save
autocmd! BufWritePost * silent! make
