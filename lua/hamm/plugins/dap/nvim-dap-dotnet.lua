local status, dap = pcall(require, "dap")
if not status then
    return
end
-- https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#making-debugging-net-easier
-- https://github.com/Samsung/netcoredbg#running-netcoredbg
dap.adapters.coreclr = {
    type = "executable",
    command = "/Users/jason/.local/share/nvim/mason/bin/netcoredbg",
    args = {
        "--interpreter=vscode",
    },
}

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. "/"
    if vim.g["dotnet_last_proj_path"] ~= nil then
        default_path = vim.g["dotnet_last_proj_path"]
    end
    local path = vim.fn.input("Path to your *proj file", default_path, "file")
    vim.g["dotnet_last_proj_path"] = path
    local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"
    print("")
    print("Cmd to execute: " .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print("\nBuild: ✔️ ")
    else
        print("\nBuild: ❌ (code: " .. f .. ")")
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        -- return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/", "file")
    end

    if vim.g["dotnet_last_dll_path"] == nil then
        vim.g["dotnet_last_dll_path"] = request()
    else
        if
            vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2)
            == 1
        then
            vim.g["dotnet_last_dll_path"] = request()
        end
    end

    return vim.g["dotnet_last_dll_path"]
end

local config = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            -- if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
            --     vim.g.dotnet_build_project()
            -- end
            return vim.g.dotnet_get_dll_path()
        end,
    },
}

dap.configurations.cs = config

-- dap.configurations.cs = {
--     {
--         type = "coreclr",
--         name = "launch - netcorebg",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file');
--         end
--     }
-- }
