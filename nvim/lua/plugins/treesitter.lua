return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "rust", "python", "cpp", "markdown", },
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = false,
				},
			}
		end
	},
	{
		'm-demare/hlargs.nvim',
		init = function()
			require('hlargs').setup({
				color = '#ffb86c',
			})
		end,
	},
}
