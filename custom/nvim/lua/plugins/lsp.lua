function lsp_keymap(ev)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf, silent = true }

  -- set keybinds
  opts.desc = "Show LSP references"
  vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  opts.desc = "Go to declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

  opts.desc = "Show LSP implementations"
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Code format"
  vim.keymap.set({ "n", "v" }, "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts)

  opts.desc = "Smart rename"
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Show line diagnostics"
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "folke/lazydev.nvim", ots = {} }
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Shell
          "bashls",

          -- JSON/YAML/XML
          "jsonls",
          "yamlls",
          "lemminx",

          -- Web
          "html",
          "marksman", -- Markdown

          -- Language
          "lua_ls",
          "pyright",
        },

        automatic_installation = {
          exclude = { "typescript-language-server" }
        },
      })

      local lspconfig = require("lspconfig")
      -- Force let the typescript-tools to do LSP for js/ts
      require("lspconfig.util").on_setup = function(config)
        if config.name == "tsserver" then return false end
      end

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        signs = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = lsp_keymap,
      })

      -- Language specific config
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "undefined-global" }
            },
          }
        }
      })
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        expose_as_code_action = { "add_missing_imports" },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeCompletionsForModuleExports = true
        }
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        -- tsserver_plugins = {},
        -- -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- -- memory limit in megabytes or "auto"(basically no limit)
        -- tsserver_max_memory = "auto",
      }
    },
  },
}
