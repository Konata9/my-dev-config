return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    
    -- Load the scheme when nvim start
    vim.cmd("colorscheme catppuccin-macchiato")
  end,
}
