-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable autoformat
vim.g.autoformat = false

local opt = vim.opt
opt.wrap = true

-- Show title
opt.title = true
opt.titlelen = 0 -- do not shorten title
opt.titlestring = 'nvim %{expand("%:p")}'

