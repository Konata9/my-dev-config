return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",  
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {  
      { "<leader><space><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" }
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",  
        layout_config = {
          horizontal = { preview_width = 0.6 },
          vertical = { preview_height = 0.7 }
        },
        path_display = { "smart_truncate" },  
        file_ignore_patterns = { "node_modules", ".git" }
      },
      pickers = {
        find_files = {
          theme = "dropdown", 
          hidden = true  
        }
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end
}
