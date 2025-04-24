return  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local util = require("lspconfig/util")

      local on_attach = function(client, bufnr)
        -- General setting
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.diagnostic.config({
          virtual_text = {
            prefix = "●",
            spacing = 4,
          },
          float = {
            border = "rounded",
            source = "always",
          },
          signs = true,
          underline = true,
          update_in_insert = false,
        })

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
      end

    local ft_to_lsp = {
      javascript = { "ts_ls" },
      typescript = { "ts_ls" },
      markdown = { "marksman" },
      go = { "gopls" },
      sh = { "bashls" },
      yaml = { "yamlls" },
      json = { "jsonls" },
      python = { "pyright" }
    }

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local fts = ft_to_lsp[vim.bo[args.buf].filetype]
        if fts then
          for _, lsp in ipairs(fts) do
            lspconfig[lsp].setup(default_config) -- 全部使用统一配置
          end
        end
      end
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" }
    }
   end
  }
