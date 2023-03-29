local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	sync_root_with_cwd = true,
	renderer = {
		-- icons = {
		-- 	show = {
		-- 		file = false,
		-- 		folder = false,
		-- 		folder_arrow = false,
		-- 	},
		-- },
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- remove close arrow
					arrow_open = "", -- remove open arrow
				},
			},
		},
		highlight_git = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	view = {
		relativenumber = true,
		hide_root_folder = false,
	},
	git = {
		ignore = false,
	},
})
