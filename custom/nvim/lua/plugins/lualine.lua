return {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPost",
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    {
      "lewis6991/gitsigns.nvim",
      event = "BufEnter",
      config = true
    }
  },
  opts = {
    refresh = {
      statusline = 1000
    },
    options = {
      theme = "auto",
      component_separators = "|",
      section_separators = { left = "", right = "" }
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "branch",
          icon = "",
          color = { gui = "bold" }
        },
      },
      lualine_c = { 
        {
          "filename",
          path = 1,  
          symbols = {
            modified = "[+]",  -- Modified
            readonly = "[-]",  -- Readonly 
            unnamed = "[No Name]"  -- Buffer
          }
        }
      },
      lualine_x = { "filetype",},
      lualine_y = { "progress" },
      lualine_z = { "%3l:%-2c" }  -- line:column
    },
    extensions = {"neo-tree"}
  }
}
