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
--opt.guicursor = "n-v-c-i:block" -- make cursor a block in all modes
opt.showmode = true
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

-- netrw
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 40
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

-- statusline
local function git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	if string.len(branch) > 0 then
		return branch
	else
		return ":"
	end
end

local function statusline()
	local set_color_1 = "%#TelescopeSelectionCaret#"
	-- local branch = git_branch()
	local set_color_2 = "%#StatusLine#"
	local file_name = " %f"
	local modified = "%m"
	local align_right = "%="
	-- local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
	-- local fileformat = " [%{&fileformat}]"
	-- local filetype = " %y"
	local percentage = " %p%%"
	-- local linecol = " %l:%c"

	return string.format(
		-- "%s %s %s%s%s%s%s%s%s%s%s",
		"%s%s%s%s%s%s ",
		set_color_1,
		-- branch,
		set_color_2,
		file_name,
		modified,
		align_right,
		-- filetype,
		-- fileencoding,
		-- fileformat,
		percentage
		-- linecol
	)
end

vim.opt.statusline = statusline()
