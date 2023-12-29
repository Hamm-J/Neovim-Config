-- vim.cmd("colorscheme horizon")
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme oxocarbon")
-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme gruvbox-mix")
-- vim.cmd("colorscheme gruvbox-original")
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme onedark_vivid")
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme monokai-pro")

-- require('rose-pine').setup({
--     variant = 'auto',
--     dark_variant = 'moon'
-- })
--
-- vim.cmd("colorscheme rose-pine")

-- disable semantic highlighting added in neovim 0.9
-- source: https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
local links = {
	["@lsp.type.namespace"] = "@namespace",
	["@lsp.type.type"] = "@type",
	["@lsp.type.class"] = "@type",
	["@lsp.type.enum"] = "@type",
	["@lsp.type.interface"] = "@type",
	["@lsp.type.struct"] = "@structure",
	["@lsp.type.parameter"] = "@parameter",
	["@lsp.type.variable"] = "@variable",
	["@lsp.type.property"] = "@property",
	["@lsp.type.enummember"] = "@constant",
	["@lsp.type.function"] = "@function",
	["@lsp.type.method"] = "@method",
	["@lsp.type.macro"] = "@macro",
	["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
	vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
