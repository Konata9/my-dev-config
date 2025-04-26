return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      fold = {
        enable = true,
        disable = { "markdown" },
      },
      ensure_installed = {
        "bash",
        "css", 
        "dockerfile", 
        "html", 
        "javascript", 
        "json", 
        "lua", 
        "markdown", 
        "python", 
        "rust",
        "typescript", 
        "vim", 
        "yaml", 
        "toml", 
        "sql"
      },
    })
  end
}
