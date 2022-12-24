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
keymap.set("n", "<leader>sn", "<C-w>T")

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

-- *** debugger ***
-- plugin: nvim-dap
keymap.set("n", "<F8>", ":lua require'dap'.continue()<CR>")
keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

-- plugin: nvim-dap-ui
keymap.set("n", "<leader>db", ':lua require("dapui").toggle()<CR>')

-- *** git ***
-- plugin: gitsigns
keymap.set("n", "<leader>ga", ":Gitsigns toggle_deleted<CR>")
keymap.set("n", "<leader>gs", ":Gitsigns diffthis<CR>")
keymap.set("n", "<leader>j", ":Gitsigns next_hunk<CR>")
keymap.set("n", "<leader>k", ":Gitsigns prev_hunk<CR>")

-- plugin: vim-fugitive
