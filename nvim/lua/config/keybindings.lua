--Use pace as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", noremap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", noremap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", noremap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap= true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap= true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = true })

-- -- Resize window using <ctrl> arrow keys
map("n", "<leader>wk", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<leader>wj", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<leader>wh", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<leader>wl", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- buffers
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

