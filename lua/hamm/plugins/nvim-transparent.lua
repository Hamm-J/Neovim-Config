local status, transparent = pcall(require, "transparent")
if not status then
	return
end

transparent.setup({
	enable = true,
	extra_groups = {
		"Pmenu", -- popup menu
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
		"lualine_x_filetype_DevIconLua_normal",
		"lualine_x_filetype_DevIconLua_insert",
		"lualine_x_filetype_DevIconLua_command",
		"lualine_x_filetype_DevIconLua_visual",
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
		-- plugin: nvim-tree
		"NvimTreeNormal",
		-- plugin: barbar
		--"BufferTabpageFill", -- doesn't work for some reason
		"BufferCurrent",
		"BufferInactive",
		"BufferVisible",
		"BufferCurrentSign",
		"BufferInactiveSign",
		"BufferVisibleSign",
		"BufferCurrentMod",
		"BufferInactiveMod",
		"BufferVisibleMod",
		-- plugin: telescope
		"TelescopeNormal",
	},
})

-- plugin: barbar
-- manually change the background color of barbar because the transparent
-- plugin is not working for some reason
vim.cmd([[ hi BufferTabpageFill guibg=NONE ctermbg=NONE ]])
