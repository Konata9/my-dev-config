return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  opts = {
    -- Core visualization
    indent = {
      char = "▏",  -- Thin vertical bar (U+258F)
    },
    -- Context awareness
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      highlight = "IblCurrentScope",  -- Scope guides
      include = {
        node_type = {
          ["*"] = {
            "class", "function", "method", 
            "block", "arguments", "table",
            "object", "^while", "^if",
            "jsx_element"
          },
        },
      },
   },

    -- Exclusion rules (prevents neo-tree interference)
    exclude = {
      filetypes = {
        "neo-tree", "neo-tree-popup",
        "dashboard", "help", "terminal",
        "lazy", "mason", "TelescopePrompt"
      },
      buftypes = {
        "terminal", "nofile", "prompt",
        "quickfix", "nofile"
      },
    },

    -- Advanced customization
    whitespace = {
      remove_blankline_trail = true,
    },
  },
  config = function(_, opts)
    if not package.loaded["catppuccin"] then
      require("catppuccin").setup()
    end

    local macchiato = require("catppuccin.palettes").get_palette("macchiato")

    vim.api.nvim_set_hl(0, "IblCurrentScope", { 
      fg = macchiato.yellow,
      bold = true
    })
    
    require("ibl").setup(opts)

    -- Dynamic refresh (only show when cursor moves)
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.schedule_wrap(function()
        require("ibl").refresh()
      end)
    })
  end
}
