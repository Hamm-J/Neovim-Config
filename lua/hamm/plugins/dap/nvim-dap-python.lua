local status, dap_python = pcall(require, "dap-python")
if not status then
	return
end

-- Install python modules in this venv for the debugger
local debugpy_path = "~/.virtualenvs/debugpy/bin/python"

dap_python.setup(debugpy_path)
