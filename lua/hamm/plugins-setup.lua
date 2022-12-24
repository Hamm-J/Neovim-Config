local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- Autocommand that reloads nvim whenever you save this file
local packer_bootstrap = ensure_packer()
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	--package management
	use("wbthomason/packer.nvim") -- package manager
	use("nvim-lua/plenary.nvim") -- lua functions that many other plugins use

	-- colorscheme
	--use("ntk148v/vim-horizon")
	use("lunarvim/horizon.nvim")

	-- transparent background
	use("xiyaowong/nvim-transparent")

	-- quality of life
	use("szw/vim-maximizer") -- maximizes and restores current window dimensions
	use("numToStr/Comment.nvim") -- commenting gc
	use("kyazdani42/nvim-web-devicons") -- file explorer icons

	-- explorer
	use("nvim-tree/nvim-tree.lua") -- file explorer

	-- status bar and tabline/winbar
	use("nvim-lualine/lualine.nvim")
	--use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })

	-- fuzzy search
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- git
	use("lewis6991/gitsigns.nvim")

	-- debugger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text") -- show debug values next to line in code
	use("leoluz/nvim-dap-go") -- golang
	use("mfussenegger/nvim-dap-python") -- python

	if packer_bootstrap then
		require("packer").sync()
	end
end)
