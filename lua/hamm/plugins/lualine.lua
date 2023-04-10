local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_horizon = require("lualine.themes.horizon")

lualine.setup({
	options = {
		theme = lualine_horizon,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
		},
		lualine_c = {
			--"filename",
		},
		lualine_x = { "progress" },
		lualine_y = { "location" },
		lualine_z = {
			"filename",
			-- "filetype",
			-- "fileformat",
			-- "encoding",
		},
	},
	-- tabline = {
	-- 	-- lualine_a = { "buffers" },
	-- 	lualine_a = { "filename" },
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_x = {},
	-- 	lualine_y = { "" },
	-- 	-- lualine_z = { "tabs" },
	-- 	lualine_z = {},
	-- },
})
