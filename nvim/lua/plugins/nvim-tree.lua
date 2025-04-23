return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {"<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree"},
    },
    init = function()
      vim.api.nvim_create_autocmd({"VimEnter", "DirChanged"}, {
          callback = function()
              if vim.fn.argc() == 0 then
                  require("nvim-tree.api").tree.open()
              end
          end,
      })
    end,
    config = function()
        local function on_attach(bufnr)
          local api = require("nvim-tree.api")
          local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

          vim.keymap.set("n", "l", api.node.open.edit, opts)
          vim.keymap.set("n", "o", api.node.open.edit, opts)
          vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
          vim.keymap.set("n", "s", api.node.open.vertical, opts)
        end

        require("nvim-tree").setup({
          on_attach = on_attach,
          view = {
            width = 30,
            side = "left"
          },
          actions = {
            open_file = { quit_on_open = false },
          },
       })
    end,
}

