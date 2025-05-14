return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",  -- Auto-install/update parsers
  event = { "VeryLazy" },  -- Lazy loading
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install these parsers automatically
      ensure_installed = {
        "bash",
        "diff",
        "html", 
        "lua", 
        "dockerfile",
        "javascript", 
        "jsdoc",
        "json", 
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "vim",
        "vimdoc",
        "xml",
        "yaml"
      },
      
      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false  -- Avoid conflicts
      },

      -- Enable smart indentation (required for indent-blankline)
      indent = { enable = true },

      -- Enable incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    })
  end
}
