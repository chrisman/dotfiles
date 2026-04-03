local Plug = vim.fn["plug#"]

vim.call("plug#begin", vim.fn.stdpath("data") .. "/plugged")

-- colors
Plug "EdenEast/nightfox.nvim"

-- editor
Plug "easymotion/vim-easymotion"
Plug "godlygeek/tabular"
Plug "neovim/nvim-lspconfig"
Plug "scrooloose/nerdtree"
Plug "Xuyuanp/nerdtree-git-plugin"
Plug "tpope/vim-surround"
Plug("glacambre/firenvim", { ["do"] = function() vim.fn["firenvim#install"](0) end })
Plug("mattn/emmet-vim", { ["for"] = { "html", "astro" } })
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })

-- snippets
Plug "SirVer/ultisnips"
Plug "honza/vim-snippets"

-- git
Plug "tpope/vim-fugitive"
Plug "airblade/vim-gitgutter"

-- fuzzy find
Plug("junegunn/fzf", { ["do"] = function() vim.fn["fzf#install"]() end })
Plug "junegunn/fzf.vim"

-- writing
Plug "vimwiki/vimwiki"
Plug "preservim/vim-pencil"
Plug "folke/zen-mode.nvim"
Plug "preservim/vim-markdown"

-- languages
Plug("posva/vim-vue", { ["for"] = "vue" })
Plug "jparise/vim-graphql"
Plug "zaid/vim-rec"
Plug "NoahTheDuke/vim-just"

vim.call("plug#end")

-- plugin config

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-y>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsListSnippets = "<c-tab>"

vim.g.EasyMotion_smartcase = 1

vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git"'
if vim.env.TMUX then
  vim.g.fzf_layout = { tmux = "90%,70%" }
else
  vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
end

vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_listsyms = "✗○◐●✓"
vim.g.vimwiki_folding = "list"
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_list = {
  {
    name = "knowledge",
    path = "~/knowledge",
    auto_toc = 1,
    auto_tags = 1,
    syntax = "markdown",
    ext = ".md",
    index = "Home",
    custom_wiki2html = "mdwiki2html",
  },
}

vim.g["pencil#wrapModeDefault"] = "soft"

if vim.g.started_by_firenvim then
  vim.opt.laststatus = 0
else
  vim.opt.laststatus = 2
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fennel",
  callback = function() vim.fn.PareditInitBuffer() end,
})

vim.cmd("colorscheme duskfox")

require("nvim-treesitter").setup({
  ensure_installed = { "typescript", "tsx", "python", "markdown", "markdown_inline", "lua" },
  auto_install = true,
})
