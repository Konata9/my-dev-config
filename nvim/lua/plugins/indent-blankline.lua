return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { show_start = false, show_end = false },
    exclude = {
      buftypes = {
        "nofile",
        "Trouble",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm",
        "trouble",
      },
      filetypes = {
        "neo-tree",
        "help",
        "lazy"
      }
    },
  }
}
