-- vim.cmd("colorscheme horizon")
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme oxocarbon")
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme gruvbox-mix")
-- vim.cmd("colorscheme gruvbox-original")
-- vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme onedark_vivid")
-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme ayu")
-- vim.cmd("colorscheme monokai-pro")
-- vim.cmd("colorscheme tender")
-- vim.cmd("colorscheme nordic")
-- vim.cmd("colorscheme melange")
--
-- vim.cmd("colorscheme zenbones")
-- vim.cmd("colorscheme zenwritten")
-- vim.cmd("colorscheme rosebones")
-- vim.cmd("colorscheme duckbones")
-- vim.cmd("colorscheme github_dark")
-- vim.cmd("colorscheme github_dark_default")
-- vim.cmd("colorscheme github_dark_dimmed")

-- require("rose-pine").setup({
--     variant = "auto", -- auto, main, moon, or dawn
--     dark_variant = "main", -- main, moon, or dawn
--     dim_inactive_windows = false,
--     extend_background_behind_borders = true,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = false,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")

-- require("NeoSolarized").setup({
--     style = "dark",      -- "dark" or "light"
--     transparent = true,  -- true/false; Enable this to disable setting the background color
--     terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--     enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
--     styles = {
--         -- Style to be applied to different syntax groups
--         comments = { italic = true },
--         keywords = { italic = false },
--         functions = { bold = true },
--         variables = {},
--         string = { italic = true },
--         underline = true, -- true/false; for global underline
--         undercurl = true, -- true/false; for global undercurl
--     },
--     -- Add specific hightlight groups
--     on_highlights = function(highlights, colors)
--         -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
--     end,
-- })
-- vim.cmd("colorscheme NeoSolarized")

-- disable semantic highlighting added in neovim 0.9
-- source: https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
local links = {
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.struct"] = "@structure",
    ["@lsp.type.parameter"] = "@parameter",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.enummember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.method"] = "@method",
    ["@lsp.type.macro"] = "@macro",
    ["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
    vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
