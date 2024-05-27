local status, dapui = pcall(require, "dapui")
if not status then
    return
end

-- dapui.setup({})
dapui.setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = "",
        },
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<ESC>" },
        },
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
    },
    layouts = {
        {
            elements = {
                {
                    id = "watches",
                    size = 0,
                },
                {
                    id = "breakpoints",
                    size = 0.15,
                },
                {
                    id = "scopes",
                    size = 0.70,
                },
                {
                    id = "stacks",
                    size = 0.15,
                },
            },
            position = "right",
            size = 0.5,
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 1.0,
                },
                {
                    id = "console",
                    size = 0.0,
                },
            },
            position = "bottom",
            size = 0.3,
        },
    },
    mappings = {
        edit = "<c-e>",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
    },
    render = {
        indent = 1,
        max_value_lines = 100,
    },
})
