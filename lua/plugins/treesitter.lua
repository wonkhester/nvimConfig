return { 
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate', -- Runs TSUpdate after installation
	dependencies = {
		'nvim-treesitter/playground',
	},
	opts = {
		ensure_installed = {
			-- Scripting Languages
			'lua', 'python', 'perl', 'ruby', 'bash',

			-- Web Development
			'javascript', 'typescript', 'html', 'css', 'scss', 'json', 'yaml', 'graphql', 'tsx',

			-- System Programming
			'c', 'cpp', 'rust', 'go', 'zig',

			-- Backend & Server-side
			'java', 'kotlin', 'csharp', 'php', 'sql', 'dockerfile',

			-- Functional & Data Science
			'haskell', 'elixir', 'clojure', 'r', 'julia',

			-- Other Useful Languages
			'markdown', 'markdown_inline', 'vim', 'vimdoc', 'toml',
		},	
		highlight = { enable = true },
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
}
