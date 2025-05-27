-- Color Scheme
return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = { blink_cmp = true },
  },
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme catppuccin-macchiato]])
  end
}
