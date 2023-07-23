return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			-- 'debugloop/telescope-undo.nvim',
			'nvim-telescope/telescope-fzf-writer.nvim',
			'gbrlsnchs/telescope-lsp-handlers.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			'AckslD/nvim-neoclip.lua',
		},
		init = function()
			require('telescope').setup {
				defaults = {
					layout_strategy = 'horizontal',
					sorting_strategy = 'ascending',
					layout_config = {
						horizontal = {
							height = 0.4,
							prompt_position = 'top',
							width = .99,
							anchor = 'N',
						},
					},
					prompt = '» ',
				},
				pickers = {
					git_files = {
						use_git_root = true,
						show_untracked = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = 'smart_case',
					},
					--[[ undo = {
						use_delta = false,
						side_by_side = true,
						diff_context_lines = vim.o.scrolloff,
						entry_format = 'state #$ID, $STAT, $TIME',
						time_format = '',
					}, ]]
					fzf_writer = {
						minimum_grep_characters = 2,
						minimum_files_characters = 2,
						use_highlighter = true,
					},
					file_browser = {
						hijack_netrw = true,
						hidden = false,
						use_fd = true,
						display_stat = { date = true, size = true, mode = true },
					},
				}
			}
		end,
		config = function()
			require('telescope').load_extension('fzf')
			-- require('telescope').load_extension('undo')
			require('telescope').load_extension('lsp_handlers')
			require('telescope').load_extension('file_browser')
			require('telescope').load_extension('neoclip')

			vim.keymap.set('n','<C-P>', function()
				if InGitRepo() then
					vim.cmd([[Telescope git_files]])
				else
					require('telescope').extensions.fzf_writer.files()
				end
			end)
			vim.keymap.set('n','<leader>h', '<cmd>Telescope help_tags<CR>')
			vim.keymap.set('n','<C-F>',require('telescope.builtin').current_buffer_fuzzy_find)
			vim.keymap.set('n','<C-B>','<cmd>Telescope buffers<CR>')
			vim.keymap.set('n','<C-R>','<cmd>Telescope live_grep<CR>')
			vim.keymap.set('n','<C-N>','<cmd>Telescope file_browser<CR>')
			-- vim.keymap.set('n','<leader>u','<cmd>Telescope undo<CR>')
			vim.keymap.set('n','<leader>n',require('telescope').extensions.notify.notify)
		end,
	},
	{
		'stevearc/dressing.nvim',
		init = function()
			require('dressing').setup()
		end,
	},
}
