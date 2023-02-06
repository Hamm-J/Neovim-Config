local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
	enable = true,
	extra_groups = {
		"Pmenu", -- popup menu
		"NormalFloat",
		"MsgArea", -- commandline background

		-- plugin: lualine
		"lualine_a_normal",
		"lualine_b_normal",
		"lualine_c_normal",
		"lualine_a_inactive",
		"lualine_b_inactive",
		"lualine_c_inactive",
		"lualine_a_command",
		"lualine_a_insert",
		"lualine_a_visual",
		"lualine_b_diagnostics_hint_normal",
		"lualine_b_diagnostics_hint_insert",
		"lualine_b_diagnostics_hint_command",
		"lualine_b_diagnostics_hint_visual",
		"lualine_b_diagnostics_error_normal",
		"lualine_b_diagnostics_error_insert",
		"lualine_b_diagnostics_error_command",
		"lualine_b_diagnostics_error_visual",
		"lualine_b_diagnostics_warn_normal",
		"lualine_b_diagnostics_warn_insert",
		"lualine_b_diagnostics_warn_command",
		"lualine_b_diagnostics_warn_visual",
		"lualine_b_diagnostics_info_normal",
		"lualine_b_diagnostics_info_insert",
		"lualine_b_diagnostics_info_command",
		"lualine_b_diagnostics_info_visual",
		-- git
		"lualine_b_diff_added_normal",
		"lualine_b_diff_added_insert",
		"lualine_b_diff_added_command",
		"lualine_b_diff_added_visual",
		"lualine_b_diff_modified_normal",
		"lualine_b_diff_modified_insert",
		"lualine_b_diff_modified_command",
		"lualine_b_diff_modified_visual",
		"lualine_b_diff_removed_normal",
		"lualine_b_diff_removed_insert",
		"lualine_b_diff_removed_command",
		"lualine_b_diff_removed_visual",
		-- language devicons: disabled lualine_x component from bar
		-- lua
		-- "lualine_x_filetype_DevIconLua_normal",
		-- "lualine_x_filetype_DevIconLua_insert",
		-- "lualine_x_filetype_DevIconLua_command",
		-- "lualine_x_filetype_DevIconLua_visual",
		-- go
		-- "lualine_x_filetype_DevIconGo_normal",
		-- "lualine_x_filetype_DevIconGo_insert",
		-- "lualine_x_filetype_DevIconGo_command",
		-- "lualine_x_filetype_DevIconGo_visual",
		-- python
		-- "lualine_x_filetype_DevIconPy_normal",
		-- "lualine_x_filetype_DevIconPy_insert",
		-- "lualine_x_filetype_DevIconPy_command",
		-- "lualine_x_filetype_DevIconPy_visual",

		-- plugin: nvim-tree
		"NvimTreeNormal",

		-- plugin: telescope
		"TelescopeNormal",
		-- plugin: barbar
		--"BufferTabpageFill", -- doesn't work for some reason
		--"BufferCurrent",
		--"BufferInactive",
		--"BufferVisible",
		--"BufferCurrentSign",
		--"BufferInactiveSign",
		--"BufferVisibleSign",
		--"BufferCurrentMod",
		--"BufferInactiveMod",
		--"BufferVisibleMod",
		--"BufferTabpages",

		-- plugin: lspsaga
		"LspSagaFinderSelection",
		"DefinitionFile",
	},
})

-- manually change background color of float window because transparent plugin
-- is not working for some reason
vim.cmd([[ hi FloatBorder guibg=NONE ctermbg=NONE ]])

-- plugin: barbar
-- manually change the background color of barbar because the transparent
-- plugin is not working for some reason
--vim.cmd([[ hi BufferTabpageFill guibg=NONE ctermbg=NONE ]])
