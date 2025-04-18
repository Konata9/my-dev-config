--Use pace as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", noremap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", noremap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", noremap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap= true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap= true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
