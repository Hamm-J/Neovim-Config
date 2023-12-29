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

    -- colorschemes
    use("ntk148v/vim-horizon")
    use("lunarvim/horizon.nvim")
    use("catppuccin/nvim")
    use("folke/tokyonight.nvim")
    use("rose-pine/neovim")
    use("rebelot/kanagawa.nvim")
    use("nyoom-engineering/oxocarbon.nvim")
    use("loctvl842/monokai-pro.nvim")
    use("joshdick/onedark.vim")
    use("olimorris/onedarkpro.nvim")
    use("sainnhe/gruvbox-material")
    use("ayu-theme/ayu-vim")

    -- quality of life
    use("numToStr/Comment.nvim")    -- commenting gc
    -- use("kyazdani42/nvim-web-devicons") -- file explorer icons
    use("norcalli/nvim-colorizer.lua") -- show color for color values
    use("mbbill/undotree")          -- visualize undos
    use("mattn/emmet-vim")          -- emmett for html boilerplate

    -- status bar and tabline/winbar
    -- use("nvim-lualine/lualine.nvim")

    -- fuzzy search
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {                   -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
            { "Hoffs/omnisharp-extended-lsp.nvim" },
        },
    })

    -- flutter
    use({
        "akinsho/flutter-tools.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
    })

    -- formatting & linting
    -- use("jose-elias-alvarez/null-ls.nvim")
    use("nvimtools/none-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        -- dart treesitter is slow
        -- https://www.reddit.com/r/nvim/comments/147u8ln/nvim_lags_when_a_dart_file_is_opened/
        -- https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
        commit = "33eb472b459f1d2bf49e16154726743ab3ca1c6d",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- git
    use("lewis6991/gitsigns.nvim") -- no lua
    use("tpope/vim-fugitive")

    -- debugger
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use("theHamsta/nvim-dap-virtual-text") -- show debug values next to line in code
    use("leoluz/nvim-dap-go")           -- golang
    use("mfussenegger/nvim-dap-python") -- python

    if packer_bootstrap then
        require("packer").sync()
    end
end)
