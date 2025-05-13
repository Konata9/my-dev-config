-- In your plugins specification file (e.g. lua/plugins/filetree.lua)
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          -- Open neo-tree if:
          -- 1. No file arguments, OR
          -- 2. First argument is a directory
          if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
            require("neo-tree").setup({})
            vim.cmd("Neotree show")
          end  
        end
      })
    end,
    keys = {          -- Immediate load on keypress
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer (Neo-tree)" },
      { "<leader>b", "<cmd>Neotree show buffers<cr>", desc = "Buffer list" },  -- Buffer list
    },
    opts = {          -- Recommended over config()
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      popup_border_style = "rounded",
      sources = { "filesystem", "buffers" },
      source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal"
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = false,  -- Disable space to prevent conflict
        }
      },
      filesystem = {
        -- bind_to_cwd = true,
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_current"
      },
      buffers = {
        follow_current_file = { enabled = true },
      }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",  -- Optional but recommended
        opts = {
          filter_rules = {
            include_current_win = true,
            autoselect_one = true
          }
        }
      }
    }
  }
}
