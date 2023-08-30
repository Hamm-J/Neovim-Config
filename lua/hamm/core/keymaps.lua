vim.g.mapleader = " "

local keymap = vim.keymap

-- *** typing ***
keymap.set("i", "<S-tab>", "<C-d>")

-- *** find and replace ***
keymap.set("n", "<leader>rwu", "#``cgN")
keymap.set("n", "<leader>rwd", "*``cgn")

-- *** buffers ***
-- close buffers/splits
keymap.set("n", "<c-w>", ":bd<CR>")
keymap.set("n", "<leader>cs", ":close<CR>")
keymap.set("n", "<leader>csb", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- close split buffer, but not split
keymap.set("n", "<leader>ca", ":%bd|e#<CR>")

-- navigate splits
keymap.set("n", "<c-k>", ":wincmd k<CR>")
keymap.set("n", "<c-j>", ":wincmd j<CR>")
keymap.set("n", "<c-h>", ":wincmd h<CR>")
keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- navigate buffers
-- requires terminal configuration
-- source: https://www.reddit.com/r/neovim/comments/uc6q8h/ability_to_map_ctrl_tab_and_more/
keymap.set("n", "<C-Tab>", ":bnext<CR>")
keymap.set("n", "<C-S-Tab>", ":bprevious<CR>")
keymap.set("n", "<leader>sn", "<C-w>T")
keymap.set("n", "<leader>bf", ":buffers<CR>")

-- *** file explorer ***
keymap.set("n", "<c-b>", ":Explore<CR>")
keymap.set("n", "<leader><c-b>", ":Rex<CR>")

-- *** jumplist ***
keymap.set("n", "<leader>j", ":jumps<CR>")
keymap.set("n", "<leader>cj", ":clearjumps<CR>")

-- *** fuzzy search ***
-- plugin: telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader><C-p>", "<cmd>Telescope resume<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- *** clipboard ***
keymap.set("n", "x", '"_x') -- prevent x from filling up yank buffer
keymap.set("n", "X", '"_x') -- prevent X from filling up yank buffer
-- keymap.set("n", "D", '"_x') -- prevent X from filling up yank buffer

-- *** debugger ***
-- plugin: nvim-dap
keymap.set("n", "<F1>", ":lua require'dap'.terminate()<CR>")
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

-- *** lsp ***
keymap.set("n", "<leader>da", ":Telescope diagnostics<CR>")
-- keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

-- *** git ***
-- plugin: gitsigns
keymap.set("n", "<leader>ga", ":Gitsigns toggle_deleted<CR>")
keymap.set("n", "<leader>gs", ":Gitsigns diffthis<CR>")
keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>")
keymap.set("n", "]g", ":Gitsigns next_hunk<CR>")

-- plugin: vim-fugitive

-- *** undotree ***
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- *** cURL commands ***
-- Inspired by: https://dev.to/22mahmoud/no-more-postman-just-use-curl-vim-2mha

-- Set the keymap
function RunShell()
	vim.cmd("!sh %")
end

function RunShellOutput()
	local lines = vim.fn.getline(1, "$")
	local command = ""
	for key, val in pairs(lines) do
		command = command .. val
	end
	local output = vim.fn.systemlist(command)
	vim.api.nvim_command("vertical new")
	local buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end

-- Map the function to a custom key
vim.api.nvim_set_keymap("n", "<leader>`", ":lua RunShell()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>~", ":lua RunShellOutput()<CR>", { noremap = true, silent = true })
