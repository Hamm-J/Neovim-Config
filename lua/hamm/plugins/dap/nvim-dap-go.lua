local status, dap_go = pcall(require, "dap-go")
if not status then
	return
end

dap_go.setup()
