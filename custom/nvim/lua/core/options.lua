-- Basic settings
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.ruler = false

vim.opt.tabstop = 2      -- Tab character width
vim.opt.shiftwidth = 2   -- Auto-indent width
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.mouse = 'a'      -- Enable mouse support

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true  -- Smart case (case-sensitive when uppercase present)

-- UI settings
vim.opt.termguicolors = true -- Enable true color support
-- vim.opt.cursorcolumn = true -- Highlight current column
vim.opt.cursorline = true    -- Highlight current line
vim.opt.signcolumn = 'yes'   -- Always show sign column (for diagnostics etc)

-- Show invisible chars (space as dot)
vim.opt.list = true
vim.opt.listchars = "space:·"

-- Text wrapping
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Wrap at word boundaries (not mid-word)
vim.opt.breakindent = true -- Maintain indentation in wrapped lines
vim.opt.showbreak = '↳ ' -- Custom prefix for wrapped lines (optional)

-- Disable backup files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.title = true
vim.opt.titlestring = vim.fs.basename(vim.fn.getcwd())

-- Share clipboard
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2    -- Size of an indent
vim.opt.smartindent = true

vim.opt.laststatus = 3 -- global statusline

-- Fold setting
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.foldtext = "v:lua.CustomFoldText()"
function CustomFoldText()
  local line = vim.fn.getline(vim.v.foldstart)

  return string.sub(line, 1, 50) -- Keep 50 chars
end

