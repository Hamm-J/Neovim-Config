vim.cmd("colorscheme horizon")

local status, _ = pcall(vim.cmd, "colorscheme horizon")
if not status then
	print("Colorscheme not found!")
	return
end
