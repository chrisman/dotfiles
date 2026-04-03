vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.md",
  callback = function() vim.bo.filetype = "markdown" end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.fnl",
  callback = function() vim.bo.filetype = "fennel" end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.astro",
  callback = function() vim.bo.filetype = "html" end,
})

vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  command = "q",
})
