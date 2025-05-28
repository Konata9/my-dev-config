return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "v2.4.0" }
  },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    {
      "<leader>/",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Interactive live grep (with args)"
    },
    { "<leader>fb",      "<cmd>Telescope buffers<cr>",    desc = "Find buffers" },
    { "<leader>fh",      "<cmd>Telescope help_tags<cr>",  desc = "Help tags" }
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = { preview_width = 0.6 },
        vertical = { preview_height = 0.7 }
      },
      path_display = { "smart_truncate" },
      file_ignore_patterns = { "node_modules", ".git" }
    },
    pickers = {
      find_files = {
        theme = "dropdown",
        hidden = true
      }
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-i>"] = function(prompt_bufnr)
              require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --ignore-case "
              })(prompt_bufnr)
            end,
            ["<C-p>"] = function(prompt_bufnr)
              local path = vim.fn.input("Search path: ", "", "dir")
              require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --iglob **/" .. path .. "/* "
              })(prompt_bufnr)
            end,
            ["<C-t>"] = function(prompt_bufnr)
              local type = vim.fn.input("Filetype: ")
              require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --type " .. type .. " "
              })(prompt_bufnr)
            end
          }
        }
      }
    }
  },
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("live_grep_args")
  end
}
