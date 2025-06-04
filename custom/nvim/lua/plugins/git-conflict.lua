return {
  'akinsho/git-conflict.nvim',
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>gc", "<cmd>GitConflictListQf<cr>", desc = "Show conflicts" },
  },
  config = true
}
