-- vim.cmd([[ hi PmenuSel guibg=#1c1e26 ctermbg=gray ]])
-- vim.cmd([[ hi PmenuSel guibg=#4B4C53 ctermbg=gray ]])
vim.cmd([[ hi PmenuSel guibg=#214a63 ctermbg=gray ]])
-- vim.cmd([[ hi Visual guibg=#1c1e26 ctermbg=gray ]]) -- change color of visul mode selection
vim.cmd([[ hi ColorColumn guibg=#4B4C53 ]])

-- change background color
-- vim.cmd([[ hi Normal guibg=#080808 ctermbg=gray ]])
-- vim.cmd([[ hi Normal guibg=#080808 ctermbg=gray ]])

-- plugin: telescope
vim.cmd([[ hi TelescopeSelection guibg=#1c1e26 ctermbg=gray ]])
vim.cmd([[ hi TelescopeSelectionCaret guibg=#1c1e26 ctermbg=gray ]])

-- plugin: lualine
-- vim.cmd([[ hi lualine_a_buffers_inactive guifg=#4B4C53 ]])
-- vim.cmd([[ hi lualine_a_buffers_active guifg=#c8ccd4 ]])

vim.cmd([[ hi lualine_a_buffers_inactive guibg=#1d1f27 ]])

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
