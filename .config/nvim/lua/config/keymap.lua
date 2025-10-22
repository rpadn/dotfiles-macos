vim.g.mapleader = " "

-- simpler moving around buffers
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
-- open netrw in splits
vim.keymap.set("n", "<leader>V", ":Vex<CR>")
vim.keymap.set("n", "<leader>H", ":Sex<CR>")

-- new empty buffer in a vsplit
vim.keymap.set("n", "<leader>bn", ":vnew<CR>")
-- unload current buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>")
-- force unload current buffer
vim.keymap.set("n", "<leader>C", ":bd!<CR>")
-- TODO: review need for Buffers plugin
-- close all buffers but current
-- vim.keymap.set("n", "<leader>bo :Bdelete", "other<CR>")
--
-- -- close all hidden buffers
-- vim.keymap.set("n", "<leader>bh :Bdelete", "hidden<CR>")
-- -- close all buffers
-- vim.keymap.set("n", "<leader>ba :Bdelete", "all<CR>")
-- -- close buffers selectively
-- vim.keymap.set("n", "<leader>bs :Bdelete", "select<CR>")

-- quick save
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- yank buffer relative to sys clipboard
vim.keymap.set("n", "<leader>yr", ':let @+=expand("%")<CR>')
-- yank buffer absolute path to sys clipboard
vim.keymap.set("n", "<leader>yp", ':let @+=expand("%:p")<CR>')
-- yank filename to sys clipboard
vim.keymap.set("n", "<leader>yf", ':let @+=expand("%:t")<CR>')

-- yank into sys clipboard
vim.keymap.set("n", "<leader>Y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+y")

-- removes highlight of last search
vim.keymap.set("n", "<leader><space>", ":nohl<CR>")

-- move selected lines up/down, respecting indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when moving half page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- special paste to keep x'ed characters into void registry
vim.keymap.set("x", "<leader>p", "\"_dP")

-- diff files in current windows
vim.keymap.set("n", "<leader>df", ":windo diffthis<CR>")
vim.keymap.set("n", "<leader>dc", ":diffoff!<CR>")
-- receive / send visual selection
vim.keymap.set("v", "<leader>dg", ":diffget<CR>")
vim.keymap.set("v", "<leader>dp", ":diffput<CR>")

-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
