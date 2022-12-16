local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local lualine_horizon = require("lualine.themes.horizon")

lualine.setup({
    options = {
        theme = lualine_horizon
    }
})
