return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Auto-install/update parsers
  event = { "BufReadPre", "BufNewFile" },  -- Lazy loading
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
        "yaml",          
        "vim",
        "vimdoc",
        "xml",
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
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        }
      },
    })
  end
}
