-- invoke mason
require("mason").setup()

-- *** setup auto completion ***
-- https://github.com/hrsh7th/nvim-cmp
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    -- https://www.reddit.com/r/neovim/comments/124pi2t/neovim_native_lsp_with_tailwind_css_is_extremely/
    -- https://github.com/hrsh7th/nvim-cmp/pull/1574#issue-1710295700
    sources = {
        { name = "luasnip" }, -- For luasnip users.
        {
            name = "nvim_lsp",
            -- priority = 10,
            -- keyword_length = 6,
            -- group_index = 1,
            -- max_item_count = 30,
        },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "buffer" },
    },
    -- performance = {
    --     debounce = 500,
    --     trigger_debounce_time = 500,
    --     throttle = 550,
    --     fetching_timeout = 80,
    -- },
})

-- setup friendly-snippets
require("luasnip.loaders.from_vscode").load({
    paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
})

-- *** setup LSPs ***

-- NOTE: must be loaded before lspconfig
-- https://github.com/folke/neodev.nvim
require("neodev").setup({})

-- https://github.com/neovim/nvim-lspconfig
local lspconfig = require("lspconfig")

-- *** setup servers ***

-- js and ts
lspconfig.tsserver.setup({})

-- tailwind
lspconfig.tailwindcss.setup({
    filetypes = {
        "javascript",
        "typescript",
        "html",
        "react",
        "vue",
        "css",
        "templ",
    },
    init_options = {
        userLanguages = {
            templ = "html",
        },
    },
})

-- vue
lspconfig.volar.setup({})

-- htmx
lspconfig.htmx.setup({})

-- lua
lspconfig.lua_ls.setup({})

-- go
lspconfig.gopls.setup({
    filetypes = {
        "go",
        -- "templ"
    }
})

-- templ
lspconfig.templ.setup({})
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

-- elixir
lspconfig.elixirls.setup({
    cmd = { "/users/jason/.local/share/lsp/elixir-ls-v0.19.0/language_server.sh" },
    flags = {
        debounce_text_changes = 150,
    },
})

-- dart
require("lspconfig").dartls.setup({
  cmd = { "dart", 'language-server', '--protocol=lsp' }
})

-- c#
-- Fix omnisharp go-to-definition not working and handling assembly/decompliation loading for $metadata$ documents
-- https://www.reddit.com/r/neovim/comments/zzsybp/omnisharp_and_go_to_definition_behavior/
-- https://github.com/Hoffs/omnisharp-extended-lsp.nvim
lspconfig.omnisharp.setup({
    cmd = {
        -- omnisharp_bin,
        "/users/jason/.local/share/nvim/mason/bin/omnisharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
    },
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
})

-- SQL
lspconfig.sqlls.setup({
    cmd = {
        "sql-language-server",
        "up",
        "--method",
        "stdio",
    },
    filetypes = {
        "sql",
        "mysql",
        "psql",
    },
    root_dir = function(_)
        return vim.loop.cwd()
    end,
})

-- *** setup bindings ***
-- global
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
-- vim.keymap.set("n", "K", function()
--     vim.lsp.buf.hover()
-- end)

-- on lsp attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>ff', function()
        --   vim.lsp.buf.format { async = true }
        -- end, opts)
        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format)

        -- Fix semantic tokens for omnisharp
        -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1364720374
        -- if client.name == "omnisharp" then
        --     client.server_capabilities.semanticTokensProvider = {
        --         full = vim.empty_dict(),
        --         legend = {
        --             tokenModifiers = { "static_symbol" },
        --             tokenTypes = {
        --                 "comment",
        --                 "excluded_code",
        --                 "identifier",
        --                 "keyword",
        --                 "keyword_control",
        --                 "number",
        --                 "operator",
        --                 "operator_overloaded",
        --                 "preprocessor_keyword",
        --                 "string",
        --                 "whitespace",
        --                 "text",
        --                 "static_symbol",
        --                 "preprocessor_text",
        --                 "punctuation",
        --                 "string_verbatim",
        --                 "string_escape_character",
        --                 "class_name",
        --                 "delegate_name",
        --                 "enum_name",
        --                 "interface_name",
        --                 "module_name",
        --                 "struct_name",
        --                 "type_parameter_name",
        --                 "field_name",
        --                 "enum_member_name",
        --                 "constant_name",
        --                 "local_name",
        --                 "parameter_name",
        --                 "method_name",
        --                 "extension_method_name",
        --                 "property_name",
        --                 "event_name",
        --                 "namespace_name",
        --                 "label_name",
        --                 "xml_doc_comment_attribute_name",
        --                 "xml_doc_comment_attribute_quotes",
        --                 "xml_doc_comment_attribute_value",
        --                 "xml_doc_comment_cdata_section",
        --                 "xml_doc_comment_comment",
        --                 "xml_doc_comment_delimiter",
        --                 "xml_doc_comment_entity_reference",
        --                 "xml_doc_comment_name",
        --                 "xml_doc_comment_processing_instruction",
        --                 "xml_doc_comment_text",
        --                 "xml_literal_attribute_name",
        --                 "xml_literal_attribute_quotes",
        --                 "xml_literal_attribute_value",
        --                 "xml_literal_cdata_section",
        --                 "xml_literal_comment",
        --                 "xml_literal_delimiter",
        --                 "xml_literal_embedded_expression",
        --                 "xml_literal_entity_reference",
        --                 "xml_literal_name",
        --                 "xml_literal_processing_instruction",
        --                 "xml_literal_text",
        --                 "regex_comment",
        --                 "regex_character_class",
        --                 "regex_anchor",
        --                 "regex_quantifier",
        --                 "regex_grouping",
        --                 "regex_alternation",
        --                 "regex_text",
        --                 "regex_self_escaped_character",
        --                 "regex_other_escape",
        --             },
        --         },
        --         range = true,
        --     }
        -- end
    end,
})

-- *** general lsp settings ***
local signs = {
    -- Error = "󰅚 ",
    -- Warn = "󰀪 ",
    -- Hint = "󰌶 ",
    -- Info = " ",
    Error = "!",
    Warn = "?",
    Hint = "-",
    Info = "-",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
    })
end
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
