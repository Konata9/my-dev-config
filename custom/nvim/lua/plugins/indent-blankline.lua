local highlightGroups = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "ellisonleao/gruvbox.nvim",
  },
  opts = {
    -- Core visualization
    indent = {
      char = "│",
      tab_char = "│",
      highlight = highlightGroups,
    },
    -- Context awareness
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
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
        "neo-tree",
        "neo-tree-popup",
        "dashboard",
        "help",
        "terminal",
        "lazy",
        "mason",
        "TelescopePrompt",
        "toggleterm",
        "trouble"
      },
      buftypes = {
        "terminal", "nofile", "prompt",
        "quickfix",
      },
    },

    -- Advanced customization
    whitespace = {
      remove_blankline_trail = true,
    },
  },
  config = function(_, opts)
    local gruvboxPalete = require("gruvbox").palette

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = gruvboxPalete.neutral_red })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = gruvboxPalete.neutral_yellow })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = gruvboxPalete.neutral_blue })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = gruvboxPalete.neutral_orange })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = gruvboxPalete.neutral_green })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = gruvboxPalete.neutral_purple })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = gruvboxPalete.neutral_aqua })
    end)

    require("ibl").setup(opts)
  end
}
