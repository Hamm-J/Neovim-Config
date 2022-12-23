local status, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status then
	return
end

dap_virtual_text.setup({
	highlight_changed_variables = true,
	highlight_new_as_changed = true,
	show_stop_reason = true,
	all_references = true,
	--virt_text_win_col = 80,
})
