return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" }
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      vim.keymap.set('n', '<leader>gb', function()
        gs.blame_line()
      end, { buffer = bufnr, desc = 'Git blame line' })

      vim.keymap.set('n', '<leader>gj', gs.next_hunk, { buffer = bufnr, desc = 'Next hunk' })
      vim.keymap.set('n', '<leader>gk', gs.prev_hunk, { buffer = bufnr, desc = 'Prev hunk' })
      vim.keymap.set('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })
    end
  }
}
