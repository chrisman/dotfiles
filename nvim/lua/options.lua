local o = vim.opt
local g = vim.g

o.autoread = true
o.autowrite = true
o.background = "dark"
o.cursorline = true
o.errorbells = false
o.expandtab = true
o.fileencodings = "utf-8"
o.fileformat = "unix"
o.fileformats = "unix"
o.foldmethod = "indent"
o.foldnestmax = 10
o.gdefault = true
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "ag --vimgrep $*"
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.inccommand = "split"
o.incsearch = true
o.linebreak = true
o.number = true
o.relativenumber = true
o.shiftwidth = 2
o.smartcase = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.visualbell = true
o.wrap = true

g.mapleader = ","
g.maplocalleader = ";"

vim.cmd("syntax enable")
