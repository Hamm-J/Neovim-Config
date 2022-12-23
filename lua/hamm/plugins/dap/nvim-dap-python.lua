local status, dap_python = pcall(require, "dap-python")
if not status then
	return
end

local debugpy_path = "~/.virtualenvs/debugpy/bin/python"

dap_python.setup(debugpy_path)
