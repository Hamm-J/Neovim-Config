local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	pickers = {
		find_files = {
			-- hidden = true,
			-- show dotfiles besides .git folder
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"-g",
				"!.git",
			},
		},
	},
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<c-d>"] = actions.delete_buffer,
			},
			n = {
				["<C-d>"] = actions.delete_buffer,
				["<S-j>"] = actions.cycle_history_next,
				["<S-k>"] = actions.cycle_history_prev,
			},
		},
	},
})

telescope.load_extension("fzf")
