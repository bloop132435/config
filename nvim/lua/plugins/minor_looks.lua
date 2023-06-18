return {
	{
		'shellRaining/hlchunk.nvim',
		config = function()
			require('hlchunk').setup({
				chunk = {
					enable = true,
					use_treesitter = true,
				},
				indent = {
					enable = true,
					use_treesitter = true,
				},
				line_num = {
					enable = true,
					use_treesitter = true,
					style = "#f8f8f2",
				},
				blank = {
					enable = true,
				},
				context = {
					enable = true,
				}
			})
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
}
