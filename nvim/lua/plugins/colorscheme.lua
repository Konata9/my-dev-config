return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  opts = {
    flavour = "macchiato", 
    integrations = {
      bufferline = true, 
    },
  },
  config = function()
    -- Load the scheme when nvim start
    vim.cmd("colorscheme catppuccin")
  end,
}
