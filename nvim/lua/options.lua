local o = vim.opt
local g = vim.g

o.autoread = true
o.autowrite = true
o.background = "light"
o.backup = false
o.completeopt = { "fuzzy", "menuone", "noselect", "popup" }
o.cursorline = true
o.errorbells = false
o.expandtab = true
o.fileencodings = "utf-8"
o.fileformat = "unix"
o.fileformats = "unix"
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldnestmax = 10
o.foldlevel = 99
o.gdefault = true
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep $*"
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

g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_winsize = 25
g.netrw_list_hide = "./\\.*"

-- tabname

vim.api.nvim_create_user_command("TabName", function(opts)
  vim.t.tab_name = opts.args ~= "" and opts.args or nil
  vim.cmd.redrawtabline()
end, { nargs = "?" })

o.showtabline = 1
o.tabline = "%!v:lua.TabLine()"

function _G.TabLine()
  local s = ""
  for i,tab in ipairs(vim.api.nvim_list_tabpages()) do
    local is_current = (tab == vim.api.nvim_get_current_tabpage())
    local hl = is_current and "%#TabLineSel#" or "%#TabLine#"
    local ok, name = pcall(vim.api.nvim_tabpage_get_var, tab, "tab_name")
    if not ok or not name then
      local win = vim.api.nvim_tabpage_get_win(tab)
      local buf = vim.api.nvim_win_get_buf(win)
      name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
      if name == "" then name = "[new]" end
    end
    s = s .. hl .. " " .. i .. ":" .. name .. " "
  end
  return s .. "%#TabLineFill#"
end
