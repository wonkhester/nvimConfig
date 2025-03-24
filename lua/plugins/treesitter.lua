return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Runs TSUpdate after installation
    dependencies = {
        'nvim-treesitter/playground',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                -- Web Development & Frameworks
                "html", "css", "javascript", "typescript", "tsx", "json", "graphql",
                "vue", "svelte", "astro", "angular",

                -- Backend & General Purpose
                "python", "lua", "go", "rust", "java", "c", "cpp", "c_sharp", "kotlin", "dart",

                -- Scripting & Shell
                "bash", "vim", "vimdoc", "yaml", "toml", "perl", "ruby", "php",

                -- Database & Markup
                "sql", "markdown", "markdown_inline", "xml", "dockerfile",
            },
            highlight = { enable = true },
            sync_install = false,
            auto_install = true,
            additional_vim_regex_highlighting = false,
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = 'grn',
                    scope_incremental = 'grc',
                    node_decremental = 'grm',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
        }
    end
}
