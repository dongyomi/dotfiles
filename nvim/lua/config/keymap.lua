vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")
vim.keymap.set("n", "<A-k>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<A-j>", "<CMD>resize +2<CR>")
vim.keymap.set("n", "<A-h>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", "<CMD>vertical resize +2<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
