return {
	{
		'mtth/scratch.vim',
		config = function()
			vim.keymap.set('n', '<C-S>', '<cmd>Scratch<CR>')
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
			vim.keymap.set('n', '<leader>q', function() require('harpoon.ui').nav_file(1) end)
			vim.keymap.set('n', '<leader>w', function() require('harpoon.ui').nav_file(2) end)
			vim.keymap.set('n', '<leader>e', function() require('harpoon.ui').nav_file(3) end)
			-- vim.keymap.set('n','<leader>r',function() require('harpoon.ui').nav_file(4) end)
			vim.keymap.set('n', '<leader>f', require('harpoon.ui').toggle_quick_menu)
			vim.keymap.set('n', '<leader>m', require('harpoon.mark').add_file)
		end
	},
	-- {
	-- 	'ggandor/leap.nvim',
	-- 	config = function()
	-- 		vim.keymap.set('n','f','<Plug>(leap-forward-to)')
	-- 		vim.keymap.set('n','t','<Plug>(leap-forward-till)')
	-- 		vim.keymap.set('n','F','<Plug>(leap-backward-to)')
	-- 		vim.keymap.set('n','T','<Plug>(leap-backward-till)')
	-- 	end,
	-- },
	{
		'numToStr/FTerm.nvim',
		config = function()
			require 'FTerm'.setup({
				border     = 'rounded',
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
				cmd = {'tmux','new-session','-A','-s','fterm'},
			})
			vim.keymap.set('n', '<leader>t', require('FTerm').toggle)
		end
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>s",
				mode = { "n", "x", "o" },
				function()
					-- default options: exact mode, multi window, all directions, with a backdrop
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					-- show labeled treesitter nodes around the cursor
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					-- jump to a remote location to execute the operator
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "n", "o", "x" },
				function()
					-- show labeled treesitter nodes around the search matches
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			}
		},
	},
	{
		'monkoose/matchparen.nvim',
		config = function()
			vim.g.loaded_matchparen = 1
			require('matchparen').setup({
				on_startup = true,
				hl_group = 'MatchParen',
				augroup_name = 'matchparen',
				debounce_time = 100,
			})
		end,
	},
	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set('n', '<leader>u', '<CMD>UndotreeToggle<CR>', { silent = true, noremap = true })
		end
	},
	{
		'tpope/vim-afterimage',
	},
	{
		'willothy/flatten.nvim',
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
	{
		'famiu/bufdelete.nvim',
		config = function()
			vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<CR>', {silent = true, noremap = true})
		end
	},
	{
		'tpope/vim-abolish',
	},
	{
		'farmergreg/vim-lastplace',
	},
}
