-- defaults for all servers
vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = { snippetSupport = true },
      },
    },
  },
})

-- typescript
vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- python: pyright for intellisense (go-to-def, completions, hover, find-refs)
vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        -- "off" keeps pyright from yelling about missing types on an
        -- untyped codebase. you still get completions, go-to-def, hover, etc.
        typeCheckingMode = "off",
      },
    },
  },
})

-- python: ruff for linting + formatting (understands your existing black/isort config)
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
})

-- lua (with neovim runtime baked in so it understands vim.*)
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- markdown
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
  root_markers = { ".marksman.toml", ".git" },
})

vim.lsp.enable({ "ts_ls", "pyright", "ruff", "lua_ls", "marksman" })

-- on attach: enable completion + signature help for every server
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- inline completion as you type
    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })

    -- disable ruff's hover in favor of pyright's (ruff hover is just "ruff: rule-code")
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end

    -- buffer-local keymaps (only set when an LSP is active)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
    end
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
    map("n", "<Leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
  end,
})

-- diagnostics
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>d", vim.diagnostic.setloclist)
