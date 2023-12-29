-- vim.cmd([[ hi PmenuSel guibg=#000 ctermbg=gray ]])
-- vim.cmd([[ hi PmenuSel guibg=#4B4C53 ctermbg=gray ]])
-- vim.cmd([[ hi PmenuSel guibg=#214a63 ctermbg=gray ]])
-- vim.cmd([[ hi Visual guibg=#1c1e26 ctermbg=gray ]]) -- change color of visul mode selection
-- vim.cmd([[ hi ColorColumn guibg=#4B4C53 ]])
vim.cmd([[ hi TelescopeSelection guibg=#1d1f27 ctermbg=gray ]])

-- Make transparent
vim.cmd([[ hi Normal guibg=#080808 ctermbg=gray ]])
vim.cmd([[ hi Normal guibg=none ctermbg=gray ]])
vim.cmd([[ hi NormalNC guibg=none ctermbg=gray ]])        -- non-focused split pane
vim.cmd([[ hi NormalFloat guibg=none ctermbg=gray ]])     -- hover
vim.cmd([[ hi FloatBorder guibg=none ctermbg=gray ]])     -- hover
vim.cmd([[ hi TelescopeNormal guibg=none ctermbg=gray ]]) -- Telescope background
vim.cmd([[ hi SignColumn guibg=none ]])
vim.cmd([[ hi LineNr guibg=none ]])
vim.cmd([[ hi StatusLine guibg=none ]])
vim.cmd([[ hi Pmenu guibg=none ctermbg=gray ]])
-- vim.cmd([[ hi MyNormal guibg=none ctermbg=gray ]]) -- not needed
-- vim.cmd([[ hi MyNormalNC guibg=none ctermbg=gray ]]) -- not needed

-- plugin: telescope
-- vim.cmd([[ hi TelescopeSelection guibg=#1d1f27 ctermbg=gray ]])
-- vim.cmd([[ hi TelescopeSelectionCaret guifg=#09f7a0 guibg=#1d1f27 ctermbg=gray ]])

-- vim.cmd([[ hi modemsg guibg=#1d1f27 ctermbg=gray guifg=#e95678 ]])
-- vim.cmd([[ hi msgarea guibg=#1d1f27 ctermbg=gray guifg=#b877db ]])
-- vim.cmd([[ hi statusline guibg=#1d1f27 ctermbg=gray guifg=#fab38e ]])
-- plugin: lualine
-- vim.cmd([[ hi lualine_a_buffers_inactive guifg=#4B4C53 ]])
-- vim.cmd([[ hi lualine_a_buffers_active guifg=#c8ccd4 ]])

-- vim.cmd([[ hi lualine_a_buffers_inactive guibg=#1d1f27 ]])
-- vim.cmd([[ hi lualine_c_inactive guibg=#1d1f27 ]])
-- vim.cmd([[ hi lualine_c_normal guibg=#1d1f27 ]])

-- plugin: fugitive
-- Gdiff commands
vim.cmd([[hi DiffAdd guibg=#1d1f27 guifg=green ]])
vim.cmd([[hi DiffDelete guibg=#1d1f27 guifg=red ]])
vim.cmd([[hi DiffChange guibg=#1d1f27 guifg=blue ]])
vim.cmd([[hi DiffText guibg=#1d1f27 guifg=blue ]])
-- Git diff commands
vim.cmd([[hi diffAdded guibg=#1d1f27 guifg=green ]])
vim.cmd([[hi diffremoved guibg=#1d1f27 guifg=red ]])
vim.cmd([[hi diffChanged guibg=#1d1f27 guifg=blue ]])
vim.cmd([[hi diffComment guibg=#1d1f27 guifg=blue ]])
vim.cmd([[hi diffCommon guibg=#1d1f27 guifg=blue ]])
-- Git diff commands header
vim.cmd([[hi diffNewFile guibg=#1d1f27 guifg=white ]])
vim.cmd([[hi diffOldFile guibg=#1d1f27 guifg=white ]])
vim.cmd([[hi diffIndexLine guibg=#1d1f27 guifg=white ]])
vim.cmd([[hi diffSubname guibg=#1d1f27 guifg=white ]])
vim.cmd([[hi diffFile guibg=#1d1f27 guifg=white ]])
vim.cmd([[hi diffLine guibg=#1d1f27 guifg=aqua ]])

-- plugin: nvim-dap
-- vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
-- vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
-- vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "", bg = "#31353f" })
vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "", bg = "#31353f" })

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
    "DapLogPoint",
    { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
-- vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
-- vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
-- vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
-- vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
--
-- vim.fn.sign_define(
-- 	"DapBreakpoint",
-- 	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapBreakpointCondition",
-- 	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapBreakpointRejected",
-- 	{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define("DapStopped", { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
-- vim.fn.sign_define(
-- 	"DapLogPoint",
-- 	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
