local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- local lualine_horizon = require("lualine.themes.horizon")

lualine.setup({
    options = {
        -- theme = lualine_horizon,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- disable lualine for dapui windows
        disabled_filetypes = {
             "dapui_watches", 
             "dapui_breakpoints",
             "dapui_scopes", 
             "dapui_console",
             "dapui_stacks", 
             "dap-repl"
           }
    },
    sections = {
        lualine_a = {
            -- "branch"
            "filename"
        },
        lualine_b = {
            -- "branch",
            -- "diff",
            -- "diagnostics",
        },
        -- lualine_a = { "mode" },
        -- lualine_b = {
        -- 	"branch",
        -- 	"diff",
        -- 	"diagnostics",
        -- },
        lualine_c = {
            --"filename",
        },
        -- lualine_x = { "progress" },
        -- lualine_y = { "location" },
        lualine_x = {
            -- "diagnostics"
        },
        lualine_y = {
            -- "diff"
            -- "location"
        },
        lualine_z = {
            "progress",
            -- "filename",
            -- "buffers"
            -- "filetype",
            -- "fileformat",
            -- "encoding",
        },
    },
    tabline = {
        lualine_a = {
            -- "branch"
            {
                "buffers",
                symbols = {
                    -- alternate_file = "",
                    modified = " +"
                },
            },
        },
    -- 	lualine_a = { "filename" },
    -- 	lualine_b = {},
    -- 	lualine_c = {},
    -- 	lualine_x = {},
    -- 	lualine_y = { "" },
    	lualine_z = { "tabs" },
    -- 	lualine_z = {},
    },
})
