local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"*",
	},
	-- ensure_installed = {
	-- 	"javascript",
	-- 	"typescript",
	-- 	"css",
	-- 	"scss",
	-- 	"html",
	-- 	"markdown",
	-- 	"go",
	-- 	"gitignore",
	-- 	"python",
	-- 	"rust",
	-- 	"json",
	-- 	"sql",
	-- 	"yaml",
	-- 	"markdown",
	-- 	"lua",
	-- },
	auto_install = true,
})
