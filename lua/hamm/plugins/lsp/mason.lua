local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

-- LSP servers:
-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers

mason_lspconfig.setup({
	ensure_installed = {
		"cssls",
		"dockerls",
		"gopls",
		"tsserver",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"sqlls",
		"jsonls",
		"svelte",
		"volar",
		"docker_compose_language_service",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
		"gofumpt",
	},
})
