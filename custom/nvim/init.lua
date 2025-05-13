-- Init Lazy.nvim to load the plugins
require("config.lazy")

-- Basic settings
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.tabstop = 2            -- Tab character width
vim.opt.shiftwidth = 2         -- Auto-indent width 
vim.opt.expandtab = true       -- Convert tabs to spaces
vim.opt.mouse = 'a'            -- Enable mouse support

-- Search settings
vim.opt.ignorecase = true      -- Case insensitive search
vim.opt.smartcase = true       -- Smart case (case-sensitive when uppercase present)

-- UI settings
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.cursorline = true      -- Highlight current line
vim.opt.signcolumn = 'yes'     -- Always show sign column (for diagnostics etc)

-- Show invisible chars (space as dot)
vim.o.list = true
vim.o.listchars = "space:·"

-- Text wrapping
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.linebreak = true      -- Wrap at word boundaries (not mid-word)
vim.opt.breakindent = true    -- Maintain indentation in wrapped lines
vim.opt.showbreak = '↳ '      -- Custom prefix for wrapped lines (optional)

-- Disable backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Share clipboard
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Fold setting
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.foldtext = "v:lua.CustomFoldText()"
function CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)

  return string.sub(line, 1, 50)  -- Keep 50 chars 
end

-----------------------------------------------------------------------------------------
-- Key mappings

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Window splitting shortcuts
vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Additional useful window mappings (optional)
vim.keymap.set('n', '<leader>wd', ':close<CR>', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize window sizes' })

-- Add to your keymaps.lua or similar configuration file
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Lazy.nvim
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Show Lazy.nvim'})
-----------------------------------------------------------------------------------------

