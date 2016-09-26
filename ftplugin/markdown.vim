" :make uses pandoc to build html from markdown
setlocal makeprg=pandoc\ -o\ /tmp/%<.html\ %
" open tmp.html in the browser
nnoremap <Leader>v :!open /tmp/%<.html<CR>
