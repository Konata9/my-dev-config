return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "williamboman/mason.nvim",
    opts = {
      automatic_installation = true, 
      ensure_installed = { 
        "lua_ls",        -- Lua
        "clangd",        -- C/C++
        "pyright",       -- Python
        "rust_analyzer", -- Rust
        "ts_ls",      -- TypeScript/JavaScript
        "eslint",
        -- "gopls",         -- Go
        "jsonls",        -- JSON
        "yamlls",        -- YAML
        "marksman",      -- Markdown
        "bashls",        -- Bash
        "html",          -- HTML
        "cssls",         -- CSS
        "black"          -- Formatting
      }
    }
  }
