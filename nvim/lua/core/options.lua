-- Set UTF-8 encoding
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- Enable relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Highlight current line
vim.wo.cursorline = true

-- Show sign column for icons
vim.wo.signcolumn = "yes"

-- 2 spaces per tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- Indent shift width
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- Use spaces instead of tabs
vim.o.expandtab = true
vim.bo.expandtab = true

-- New line aligns with current line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- Case insensitive search unless uppercase used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable search highlighting
vim.o.hlsearch = true
-- Incremental search
vim.o.incsearch = true
-- Command line height of 2 for better display
vim.o.cmdheight = 2

-- Auto reload when file changed externally
vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = true

-- Allow left/right to wrap to prev/next line
vim.o.whichwrap = '<,>,[,]'
-- Allow hiding modified buffers
vim.o.hidden = true

-- Enable mouse support
vim.o.mouse = "a"

-- Disable backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Shorter update time (300ms)
vim.o.updatetime = 300
-- Timeout for key sequences (500ms)
vim.o.timeoutlen = 500

-- New splits open below and to the right
vim.o.splitbelow = true
vim.o.splitright = true

-- Don't auto-select first completion item
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- UI styling
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Show invisible chars (space as dot)
vim.o.list = true
vim.o.listchars = "space:·"

-- Enhanced completion
vim.o.wildmenu = true
-- Don't pass messages to completion menu
vim.o.shortmess = vim.o.shortmess .. 'c'
-- Max 10 completion items shown
vim.o.pumheight = 10
-- Always show tabline
vim.o.showtabline = 2
-- Hide mode text (shown in statusline plugin)
vim.o.showmode = false

-- Share clipboard
vim.o.clipboard = "unnamedplus"

-- Fold methods
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99
vim.o.foldenable = true
