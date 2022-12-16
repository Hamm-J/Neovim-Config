local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	animation = false,
	auto_hide = false,
	icons = true,
	icon_separator_active = "",
	icon_separator_inactive = "",
	insert_at_end = true, -- add new buffers to the end of list
	minimum_padding = 1,
	maximum_padding = 1,
})