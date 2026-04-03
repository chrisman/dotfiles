local g = vim.g

g.UltiSnipsExpandTrigger = "<tab>"
g.UltiSnipsJumpForwardTrigger = "<c-y>"
g.UltiSnipsJumpBackwardTrigger = "<c-z>"
g.UltiSnipsEditSplit = "vertical"
g.UltiSnipsListSnippets = "<c-tab>"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fennel",
  callback = function()
    vim.fn['PareditInitBuffer']()
  end
})

g.vimwiki_global_ext = 0
g.vimwiki_listsyms = '✗○◐●✓'
g.vimwiki_folding = 'list'
g.vimwiki_table_mappings = 0

g.vimwiki_list = {
  {
    name = 'knowledge',
    path = '~/knowledge',
    auto_toc = 1,
    auto_tags = 1,
    syntax = 'markdown',
    ext = '.md',
    index = 'Home',
    custom_wiki2html = 'mdwiki2html'
  },
  {
    name = 'game',
    path = '~/Documents/strixhaven/',
    auto_toc = 1,
    auto_tags = 1,
    path_html = '$HOME/blogs/dozens-and-dragons/out/campaign/'
  }
}

if vim.fn.exists('g:started_by_firenvim') == 1 then
  vim.opt.laststatus = 0
else
  vim.opt.laststatus = 2
end

g.EasyMotion_smartcase = 1

g['pencil#wrapModeDefault'] = 'soft'

vim.env.FZF_DEFAULT_COMMAND = 'ag -g ""'
g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_winsize = 25
g.netrw_list_hide = './\\.*'
