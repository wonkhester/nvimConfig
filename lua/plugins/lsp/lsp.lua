return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",

            -- Snippets
            "L3MON4D3/LuaSnip",
        },
        opts = {
            ensure_installed = {
                -- Web Development
                "ts_ls", "volar", "angularls", "tailwindcss", "emmet_ls", "html", "cssls", "jsonls", "graphql", "intelephense",

                -- System Programming
                "clangd", "rust_analyzer", "gopls",

                -- Backend & Enterprise
                "pyright", "jdtls", "kotlin_language_server", "omnisharp", "solargraph",

                -- DevOps & Infrastructure
                "dockerls", "terraformls", "yamlls",

                -- Scripting & Miscellaneous
                "lua_ls", "bashls", "marksman", "vimls"
            },
            servers = {
                lua_ls = {},
                ts_ls = {},
                pyright = {},
            },
            keymaps = {
                { mode = "n", key = "gd", action = vim.lsp.buf.definition, desc = "Go to definition" },
                { mode = "n", key = "K", action = vim.lsp.buf.hover, desc = "Hover" },
                { mode = "n", key = "<leader>rn", action = vim.lsp.buf.rename, desc = "Rename symbol" },
            },
            set_preferences = {
                sign_icons = {}       -- Customize diagnostic icons if needed
            },
            on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                -- LSP keymaps (navigation, code actions, etc.)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
            end,
        },
        config = function(_, opts)
            -- Setup Mason & LSPConfig
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = opts.ensure_installed,
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                lspconfig[server].setup(config)
            end

            -- Set keymaps
            for _, map in ipairs(opts.keymaps) do
                vim.keymap.set(map.mode, map.key, map.action, { desc = map.desc })
            end

            -- Setup Auto-Completion
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" },
                }),
            })
        end,
    },
}

