vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Window splitting shortcuts
vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'Split window vertically' })

-- Additional useful window mappings (optional)
vim.keymap.set('n', '<leader>wd', ':close<CR>', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Equalize window sizes' })
vim.keymap.set("n", "<leader>w8", ":vertical resize +80<CR>", { desc = "Resize window size 80" })
vim.keymap.set("n", "<leader>w2", ":vertical resize +20<CR>", { desc = "Increase window size 20" })

-- Add to your keymaps.lua or similar configuration file
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Lazy.nvim
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Show Lazy.nvim'})
