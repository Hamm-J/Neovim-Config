vim.g.mapleader = " "

local keymap = vim.keymap

-- *** general ***
keymap.set("i", "jk", "<ESC>")

-- *** split windows ***

-- adjust windows
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- equalize split window width
keymap.set("n", "<leader>ss", ":close<CR>") -- close current split window
-- plugin: vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggles between max and original window size

-- navigate windows
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- *** tabs ***
-- navigate tabs
keymap.set("n", "<Tab>", ":bnext<CR>")
keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- *** file explorer ***
-- plugin: nvim-tree
keymap.set("n", "<c-b>", ":NvimTreeToggle<CR>")

-- *** fuzzy search ***
-- plugin: telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- *** clipboard ***
keymap.set("n", "x", '"_x') -- prevent x from filling up yank buffer
