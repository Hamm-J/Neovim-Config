vim.g.mapleader = " "

local keymap = vim.keymap

-- *** typing ***
keymap.set("i", "<S-tab>", "<C-d>")

-- *** find and replace ***
keymap.set("n", "<leader>rwu", "#``cgN")
keymap.set("n", "<leader>rwd", "*``cgn")

-- *** buffers ***
-- close buffers/splits
keymap.set("n", "<leader>cb", ":bd<CR>")
keymap.set("n", "<c-Q>", ":bd<CR>")
-- keymap.set("n", "<leader>x", ":bd<CR>")
keymap.set("n", "<leader>cs", ":close<CR>")
-- keymap.set("n", "<leader>csb", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- close split buffer, but not split
keymap.set("n", "<space><c-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>") -- close split buffer, but not split
keymap.set("n", "<leader>co", ":%bd|e#<CR>")

-- tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>")
keymap.set("n", "<leader>tc", ":tabclose<CR>")
-- keymap.set("n", "tn", ":tabnew<CR>")
-- keymap.set("n", "tc", ":tabclose<CR>")

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
keymap.set("n", "<A-Tab>", ":b#<CR>")
keymap.set("n", "gb", ":bnext<CR>")
keymap.set("n", "gB", ":bprevious<CR>")
keymap.set("n", "g#b", ":b#<CR>")
-- keymap.set("n", "<C-Tab>", ":bnext<CR>")
-- keymap.set("n", "<C-S-Tab>", ":bprevious<CR>")
keymap.set("n", "<leader>sn", "<C-w>T")
keymap.set("n", "<leader>bf", ":buffers<CR>")

-- *** file explorer ***
-- keymap.set("n", "<c-b>", ":Explore<CR>")
-- keymap.set("n", "<c-b>", ":Lex!<CR>")
keymap.set("n", "<c-b>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- *** jumplist ***
-- keymap.set("n", "<leader>j", ":jumps<CR>")
keymap.set("n", "<leader>j", ":Telescope jumplist<CR>")
keymap.set("n", "<leader>cj", ":clearjumps<CR>")

-- *** fuzzy search ***
-- plugin: telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader><C-p>", "<cmd>Telescope resume<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<c-n>", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>da", "<cmd>Telescope diagnostics<cr>")

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
keymap.set("n", "<c-F11>", ":lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>bc", ":lua require'dap'.clear_breakpoints()<CR>")
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.n.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
-- keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

-- plugin: nvim-dap-ui
keymap.set("n", "<leader>db", ':lua require("dapui").toggle()<CR>')
keymap.set("n", "<leader>de", ':lua require("dapui").eval()<CR>')
keymap.set("n", "<leader>dh", ':lua require("dapui").float_element(nil, { enter = true })<CR>')
keymap.set("n", "<leader>ds", ':lua require("dapui").float_element("scopes", { enter = true })<CR><CR>')
keymap.set("n", "<leader>dr", ':lua require("dapui").float_element("repl", { enter = true })<CR><CR>')
keymap.set("n", "<leader>dc", ':lua require("dapui").float_element("stacks", { enter = true })<CR><CR>')
-- keymap.set("n", "<leader>dhb", ':lua require("dapui").float_element("breakpoints", { width = 80, enter = true })<CR>')
-- keymap.set("n", "<leader>dhw", ':lua require("dapui").float_element("watches", { width = 80, enter = true })<CR>')
-- keymap.set("n", "<leader>dhc", ':lua require("dapui").float_element("console", { width = 80, enter = true })<CR>')

-- *** lsp ***
-- keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
keymap.set("n", "<leader>lr", ":LspRestart<CR>")
keymap.set("n", "<leader>li", ":LspInfo<CR>")

-- *** plugin: auto-session ***
keymap.set("n", "<leader>ss", ":SessionSave<CR>")
keymap.set("n", "<leader>sd", ":SessionDelete<CR>")

-- *** git ***
-- plugin: gitsigns
keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>")
keymap.set("n", "]g", ":Gitsigns next_hunk<CR>")

-- plugin: vim-fugitive
keymap.set("n", "<leader>gs", ":Git status<cr>")
keymap.set("n", "<leader>ga", ":Git add .<cr>")
keymap.set("n", "<leader>gc", ":Git commit<cr>")
keymap.set("n", "<leader>gca", ":Git commit --amend<cr>")
keymap.set("n", "<leader>gd", ":Git diff<cr>")
keymap.set("n", "<leader>gdh", ":Git diff head~1<cr>")
keymap.set("n", "<leader>gl", ":Git log<cr>")

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
