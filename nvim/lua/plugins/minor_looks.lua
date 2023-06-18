return {
	{ 
		"lukas-reineke/indent-blankline.nvim",
		init = function()
			require("indent_blankline").setup {
				-- for example, context is off by default, use this to turn it on
				show_current_context = true,
				show_current_context_start = true,
				use_treesitter = true,
				use_treesitter_scope = true,
			}
		end
	},
	{
		'RRethy/vim-illuminate',
		init = function()
			require('illuminate').configure({
				providers = {
					'lsp',
					'treesitter',
					'regex',
				},
				delay = 50,
				under_cursor = true,
			})
		end
	},
	{ 
		'gen740/SmoothCursor.nvim',
		init = function()
			require('smoothcursor').setup({
				cursor = '▶'
			})
		end
	}
}
