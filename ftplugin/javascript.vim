setlocal makeprg=eslint\ -f\ compact\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m

autocmd! BufWritePost * silent! make
