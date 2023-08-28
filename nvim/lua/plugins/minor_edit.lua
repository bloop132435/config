return {
	{
		'monaqa/dial.nvim',
		config = function()
			vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
			vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
			vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), { noremap = true })
			vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), { noremap = true })
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
			vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
			vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup()
		end
	},
	{
		'abecodes/tabout.nvim',
		config = function()
			require('tabout').setup {
				tabkey = '<C-L>', -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = '', -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = false, -- shift content if tab out is not possible
				enable_backwards = false, -- well ...
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = '`', close = '`' },
					{ open = '(', close = ')' },
					{ open = '[', close = ']' },
					{ open = '{', close = '}' }
				},
			}
		end,
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({})
		end
	},
	{
		'machakann/vim-sandwich'
	},
	{
		'AckslD/nvim-neoclip.lua',
		dependencies = {
			'kkharji/sqlite.lua',
		},
		config = function()
			require('neoclip').setup({
				enable_persistent_history = true,
			})
			vim.keymap.set('n', '<leader>\'', '<cmd>Telescope neoclip<CR>')
		end,
	},
	{
		'cappyzawa/trim.nvim',
		config = function()
			require('trim').setup()
		end
	},
	{
		'tpope/vim-endwise',
	}
}
