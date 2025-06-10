return {
  { "nvim-lua/plenary.nvim", lazy = true }, -- plenary.nvim is required
  {
    "drop-stones/im-switch.nvim",
    event = "VeryLazy",
    opts = {
      macos = {
        enabled = true,
        default_im = "com.apple.keylayout.ABC"
      }
      -- your configurations
    }
  }
}
