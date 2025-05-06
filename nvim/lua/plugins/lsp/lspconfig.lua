return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    local on_attach = function(ev)
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

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- Disable snippet support if not needed for performance
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" }
    }

    local filetype_to_lsp = {
      lua = "lua_ls",
      python = "pyright",
      javascript = "ts_ls",
      typescript = "ts_ls",
      rust = "rust_analyzer",
      json = "jsonls",
      yaml = "yamlls",
      md = "marksman",
    }

    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local lsp_name = filetype_to_lsp[filetype]

        if lsp_name then
          -- Check if LSP is already active
          local clients = vim.lsp.get_active_clients({ bufnr = args.buf })
          local has_lsp = false
          for _, client in ipairs(clients) do
            if client.name == lsp_name then
              has_lsp = true
              break
            end
          end

          if not has_lsp then
            lspconfig[lsp_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
              -- set language specific config here
            })
            vim.notify(string.format("LSP: %s attached", lsp_name), vim.log.levels.INFO)
          end
        end
      end,
    })
  end
}
