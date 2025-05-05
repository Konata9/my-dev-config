return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    integrations = {
      bufferline = true,
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },
  config = function()
    -- Load the scheme when nvim start
    vim.cmd("colorscheme catppuccin")
  end,
}
