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

          vim.keymap.set("n", "a", function()
            local node = api.tree.get_node_under_cursor()
            if not node then return end  -- 防止空节点

            -- Find parent path 
            local parent_dir = node.type == "directory" 
                and (node.absolute_path .. "/")
                or (vim.fn.fnamemodify(node.absolute_path, ":h") .. "/")

            -- New file name
            local new_file = vim.fn.input("New file: ", parent_dir)
            if new_file ~= "" then
                vim.cmd("edit " .. new_file)
                vim.cmd("write")  

                api.tree.reload()            
            end
          end, opts)

          vim.keymap.set("n", "r", api.fs.rename, opts) 
          vim.keymap.set("n", "d", api.fs.remove, opts)
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

