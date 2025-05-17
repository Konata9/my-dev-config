return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ui = {
        border = "rounded",          
        icons = {
          package_installed = "✓",
          package_pending = "",    
          package_uninstalled = "✗"
        }
      },
      ensure_installed = {
        -- Shell
        "bash-language-server",
        "shellcheck",
        
        -- JSON/YAML/XML
        "jsonls",
        "yamlls",
        "lemminx",
        
        -- Web
        "html",
        "marksman",             -- Markdown
        
        -- Language
        "lua_ls",
        "pyright",
        
        "gitlint",
        "dockerfile-language-server"
      },
      max_concurrent_installers = 4, 
      -- github = {
      --   download_url_template = "https://ghproxy.com/github.com/%s/releases/download/%s/%s"
      -- }
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        handlers = {
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } }
                }
              }
            })
          end,
          
          ["dockerfile-language-server"] = function()
            require("lspconfig").dockerls.setup({
              settings = {
                docker = {
                  languageserver = {
                    formatter = { ignore = { "DL3007" } }
                  }
                }
              }
            })
          end
        }
      })
    end
  }
}
