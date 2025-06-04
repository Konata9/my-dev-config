return {
  'tanvirtin/vgit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  -- Lazy loading on 'VimEnter' event is necessary.
  event = 'VimEnter',
  keys = {
    { "<C-k>",      function() require("vgit").hunk_up() end,                mode = "n", desc = "Move to previous hunk" },
    { "<C-j>",      function() require("vgit").hunk_down() end,              mode = "n", desc = "Move to next hunk" },
    { "<leader>gs", function() require("vgit").buffer_hunk_stage() end,      mode = "n", desc = "Stage current hunk" },
    { "<leader>gr", function() require("vgit").buffer_hunk_reset() end,      mode = "n", desc = "Reset current hunk" },
    { "<leader>gp", function() require("vgit").buffer_hunk_preview() end,    mode = "n", desc = "Preview hunk changes" },
    { "<leader>gb", function() require("vgit").buffer_blame_preview() end,   mode = "n", desc = "Show blame preview" },
    { "<leader>gf", function() require("vgit").buffer_diff_preview() end,    mode = "n", desc = "Show buffer diff" },
    { "<leader>gh", function() require("vgit").buffer_history_preview() end, mode = "n", desc = "Show buffer history" },
    { "<leader>gu", function() require("vgit").buffer_reset() end,           mode = "n", desc = "Reset buffer changes" },
    { "<leader>gd", function() require("vgit").project_diff_preview() end,   mode = "n", desc = "Show project diff" },
    { "<leader>gx", function() require("vgit").toggle_diff_preference() end, mode = "n", desc = "Toggle diff view" },
  },
  opts = {
    hls = {
      GitCount = "Keyword",
      GitSymbol = "CursorLineNr",
      GitTitle = "Directory",
      GitSelected = "QuickfixLine",
      GitBackground = "Normal",
      GitAppBar = "StatusLine",
      GitHeader = "NormalFloat",
      GitFooter = "NormalFloat",
      GitBorder = "LineNr",
      GitLineNr = "LineNr",
      GitComment = "Comment",
      GitSignsAdd = { fg = "#d7ffaf" },
      GitSignsChange = { fg = "#7AA6DA" },
      GitSignsDelete = { fg = "#e95678" },
      GitSignsAddLn = "DiffAdd",
      GitSignsDeleteLn = "DiffDelete",
      GitWordAdd = { bg = "#5d7a22" },
      GitWordDelete = { bg = "#960f3d" },
      GitConflictCurrentMark = "DiffAdd",
      GitConflictAncestorMark = "Visual",
      GitConflictIncomingMark = "DiffChange",
      GitConflictCurrent = "DiffAdd",
      GitConflictAncestor = "Visual",
      GitConflictMiddle = "Visual",
      GitConflictIncoming = "DiffChange",
    },
    live_blame = {
      enabled = true,
      format = function(blame, git_config)
        local config_author = git_config["user.name"]
        local author = blame.author
        if config_author == author then
          author = "You"
        end
        local time = os.difftime(os.time(), blame.author_time) / (60 * 60 * 24 * 30 * 12)
        local time_divisions = {
          { 1,  "years" },
          { 12, "months" },
          { 30, "days" },
          { 24, "hours" },
          { 60, "minutes" },
          { 60, "seconds" },
        }
        local counter = 1
        local time_division = time_divisions[counter]
        local time_boundary = time_division[1]
        local time_postfix = time_division[2]
        while time < 1 and counter ~= #time_divisions do
          time_division = time_divisions[counter]
          time_boundary = time_division[1]
          time_postfix = time_division[2]
          time = time * time_boundary
          counter = counter + 1
        end
        local commit_message = blame.commit_message
        if not blame.committed then
          author = "You"
          commit_message = "Uncommitted changes"
          return string.format(" %s • %s", author, commit_message)
        end
        local max_commit_message_length = 255
        if #commit_message > max_commit_message_length then
          commit_message = commit_message:sub(1, max_commit_message_length) .. "..."
        end
        return string.format(
          " %s, %s • %s",
          author,
          string.format("%s %s ago", time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5), time_postfix),
          commit_message
        )
      end,
    },
    live_gutter = {
      enabled = true,
      edge_navigation = true,
    },
    scene = {
      diff_preference = "unified",
      keymaps = {
        quit = "q",
      },
    },
    diff_preview = {
      keymaps = {
        reset = "r",
        buffer_stage = "S",
        buffer_unstage = "U",
        buffer_hunk_stage = "s",
        buffer_hunk_unstage = "u",
        toggle_view = "t",
      },
    },
    project_diff_preview = {
      keymaps = {
        commit = "C",
        buffer_stage = "s",
        buffer_unstage = "u",
        buffer_hunk_stage = "gs",
        buffer_hunk_unstage = "gu",
        buffer_reset = "r",
        stage_all = "S",
        unstage_all = "U",
        reset_all = "R",
      },
    },
    project_stash_preview = {
      keymaps = {
        add = "A",
        apply = "a",
        pop = "p",
        drop = "d",
        clear = "C",
      },
    },
    project_logs_preview = {
      keymaps = {
        previous = "-",
        next = "=",
      },
    },
    project_commit_preview = {
      keymaps = {
        save = "S",
      },
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAdd = { texthl = "GitSignsAdd", text = "┃" },
        GitSignsDelete = { texthl = "GitSignsDelete", text = "┃" },
        GitSignsChange = { texthl = "GitSignsChange", text = "┃" },
      },
    },
    symbols = {
      void = "⣿",
      open = "",
      close = "",
    },
  },
  config = true
}
