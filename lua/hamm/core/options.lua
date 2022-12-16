local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true
opt.colorcolumn = "80"

-- tabs & indentation
opt.syntax = "on"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.scrolloff = 8

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.guicursor = "n-v-c-i:block" -- make cursor a block in all modes
opt.showmode = false
--vim.cmd([[ hi BufferTabpageFill guibg=NONE ctermbg=NONE ]])
--vim.cmd([[ hi PmenuSel guibg=#e95678 ctermbg=red ]])

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
-- opt.splitright = true
opt.splitbelow = true

-- word units
opt.iskeyword:append("-")
