vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.astro",
  command = "setfiletype html"
})

vim.api.nvim_create_autocmd({"TermClose"}, {
  pattern = "*",
  command = ":q"
})
