return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local cmp = require("cmp")

            mason.setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(_, bufnr)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                map("n", "K", vim.lsp.buf.hover, "Hover docs")
                map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
                map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
                map("n", "<leader>vd", vim.diagnostic.open_float, "Show Diagnostic")
            end

            mason_lspconfig.setup({
                ensure_installed = {
                    "ts_ls", "volar", "angularls", "tailwindcss", "emmet_ls",
                    "html", "cssls", "jsonls", "graphql", "intelephense",
                    "clangd", "rust_analyzer", "gopls",
                    "pyright", "jdtls", "kotlin_language_server", "omnisharp", "solargraph",
                    "dockerls", "terraformls", "yamlls",
                    "lua_ls", "bashls", "marksman", "vimls",
                },
                automatic_installation = true,

                handlers = {
                    function(server_name)
                        vim.lsp.config[server_name] = {
                            on_attach = on_attach,
                            capabilities = capabilities,
                        }
                        vim.lsp.start(vim.lsp.config[server_name])
                    end,
                },
            })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}

