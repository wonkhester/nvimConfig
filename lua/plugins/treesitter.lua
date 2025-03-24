return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate', -- Runs TSUpdate after installation
    dependencies = {
        'nvim-treesitter/playground',
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = "all",
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
