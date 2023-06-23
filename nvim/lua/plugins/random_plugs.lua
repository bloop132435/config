return {
	{
		'mtth/scratch.vim',
		config = function()
			vim.keymap.set('n','<C-S>','<cmd>Scratch<CR>')
		end
	},
	{
		'wincent/loupe'
	},
	{
		'ThePrimeagen/harpoon',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('harpoon').setup()
			vim.keymap.set('n','<leader>q',function() require('harpoon.ui').nav_file(1) end)
			vim.keymap.set('n','<leader>w',function() require('harpoon.ui').nav_file(2) end)
			vim.keymap.set('n','<leader>e',function() require('harpoon.ui').nav_file(3) end)
			vim.keymap.set('n','<leader>r',function() require('harpoon.ui').nav_file(4) end)
			vim.keymap.set('n','<leader>t', require('harpoon.ui').toggle_quick_menu)
			vim.keymap.set('n','<leader>m', require('harpoon.mark').add_file)
		end
	},
	{
		'ggandor/leap.nvim',
		config = function()
			vim.keymap.set('n','f','<Plug>(leap-forward-to)')
			vim.keymap.set('n','t','<Plug>(leap-forward-till)')
			vim.keymap.set('n','F','<Plug>(leap-backward-to)')
			vim.keymap.set('n','T','<Plug>(leap-backward-till)')
		end,
	},
}
