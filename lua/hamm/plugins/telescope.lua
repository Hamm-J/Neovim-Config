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
            initial_mode = "normal",
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
        resume = {
            initial_mode = "normal",
        },
        live_grep = {
            initial_mode = "normal",
        },
        grep_string = {
            initial_mode = "normal",
        },
        buffers = {
            initial_mode = "normal",
        },
        current_buffer_fuzzy_find = {
            initial_mode = "normal",
        },
        help_tags = {
            initial_mode = "normal",
        },
        diagnostics = {
            initial_mode = "normal",
        },
        jumplist = {
            initial_mode = "normal",
        },
	},
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<c-q>"] = actions.delete_buffer,
			},
			n = {
				["<C-q>"] = actions.delete_buffer,
				["<S-j>"] = actions.cycle_history_next,
				["<S-k>"] = actions.cycle_history_prev,
			},
		},
	},
})

telescope.load_extension("fzf")
