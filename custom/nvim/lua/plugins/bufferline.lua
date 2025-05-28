return {
  {
    "akinsho/bufferline.nvim",
    version = "v4.*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "moll/vim-bbye"
    },
    event = "BufReadPost",
    keys = {
      {
        "<leader>bb",
        "<cmd>BufferLinePick<cr>",
        desc = "Pick buffer",
      },
      {
        "<leader>bd",
        "<cmd>Bdelete!<cr>",
        desc = "Close buffer",
      },
      {
        "[b",
        "<cmd>BufferLineCyclePrev<cr>",
        desc = "Previous buffer",
      },
      {
        "]b",
        "<cmd>BufferLineCycleNext<cr>",
        desc = "Next buffer",
      },
    },
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        enforce_regular_tabs = false,
        diagnostics_throttle = 500,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' }
        },
      }
    },
  }
}
