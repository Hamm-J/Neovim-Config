local status, flutter_tools = pcall(require, "flutter-tools")
if not status then
    return
end

flutter_tools.setup({
    lsp = {
        color = {
            enabled = true,
            background = false,
            virtual_text = false,
        },
    },
    closing_tags = {
        enabled = true,
    },
    widget_guides = {
        enabled = false,
    },
    settings = {
        showTodos = false,
        -- showCompleteFunctionCalls = false,
        -- enableSnippets = false,
    }
})
