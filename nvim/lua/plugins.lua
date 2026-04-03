local Plug = vim.fn["plug#"]

vim.call("plug#begin", vim.fn.stdpath("data") .. "/plugged")
Plug "EdenEast/nightfox.nvim"
Plug "easymotion/vim-easymotion"
Plug "godlygeek/tabular"
Plug "neovim/nvim-lspconfig"
Plug "scrooloose/nerdtree"
Plug "Xuyuanp/nerdtree-git-plugin"
Plug "tpope/vim-surround"
Plug("glacambre/firenvim", { ["do"] = function() vim.fn["firenvim#install"](0) end })
Plug("mattn/emmet-vim", { ["for"] = { "html", "astro" } })
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug "SirVer/ultisnips"
Plug "honza/vim-snippets"
Plug "tpope/vim-fugitive"
Plug "airblade/vim-gitgutter"
Plug("junegunn/fzf", { ["do"] = function() vim.fn["fzf#install"]() end })
Plug "junegunn/fzf.vim"
Plug "vimwiki/vimwiki"
Plug "preservim/vim-pencil"
Plug "folke/zen-mode.nvim"
Plug "preservim/vim-markdown"
Plug("posva/vim-vue", { ["for"] = "vue" })
Plug "jparise/vim-graphql"
Plug "zaid/vim-rec"
Plug "NoahTheDuke/vim-just"
vim.call("plug#end")

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-y>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsListSnippets = "<c-tab>"

vim.g.EasyMotion_smartcase = 1

vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_listsyms = "✗○◐●✓"
vim.g.vimwiki_folding = "list"
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_list = {
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

vim.g["pencil#wrapModeDefault"] = "soft"

require("zen-mode").setup({
  window = {
    width = 90,
  },
})

if vim.g.started_by_firenvim then
  vim.opt.laststatus = 0
else
  vim.opt.laststatus = 2
end

vim.cmd("colorscheme dawnfox")

require("zen-mode").setup({
  window = {
    width = 85,
    options = {
      number = false,
      relativenumber = false,
    },
  },
  plugins = {
    options = {
      laststatus = 0,
    },
    tmux = {
      enabled = true,
    },
    gitsigns = {
      enabled = true,
    },
  },
})

require("nvim-treesitter").setup({
  ensure_installed = { "typescript", "tsx", "python", "markdown", "markdown_inline", "lua" },
  auto_install = true,
})
