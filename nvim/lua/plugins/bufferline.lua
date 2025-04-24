return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", 
    "famiu/bufdelete.nvim",       
  },
  event = "VeryLazy",              
  keys = { 
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  opts = {
    options = {
      mode = "buffers", 
      diagnostics = "nvim_lsp",
      always_show_bufferline = false, 
      offsets = {
        { 
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin", -- "slant" | "thick" | "thin"
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
      },
      custom_areas = { 
        right = function()
          return {
            { text = " " },
            { text = "%@v:lua.require'bufferline'.sort_buffers_by(function(a, b) return a.id < b.id end)@%#BufferLineTab#  " },
          }
        end,
      },
    },
  },
  config = function(_, opts)
    vim.keymap.set("n", "<leader>bd", function()
      require("bufdelete").bufdelete(0, false)
    end, { desc = "Delete buffer" })

    require("bufferline").setup(opts)

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if #vim.fn.getbufinfo({ buflisted = 1 }) < 1 then
          vim.cmd("enew")
        end
      end,
    })
  end,
}
