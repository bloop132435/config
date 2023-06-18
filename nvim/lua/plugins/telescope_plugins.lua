return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-fzf-writer.nvim",
			"gbrlsnchs/telescope-lsp-handlers.nvim",
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
				},
				extensions = {
					fzf = {
						fuzzy = true,                    
						override_generic_sorter = true,  
						override_file_sorter = true,     
						case_mode = "smart_case",        
					},
					undo = {
						use_delta = true,
						side_by_side = true,
						diff_context_lines = vim.o.scrolloff,
						entry_format = "state #$ID, $STAT, $TIME",
						time_format = "",
					}, 
					fzf_writer = {
						minimum_grep_characters = 2,
						minimum_files_characters = 2,

						-- Disabled by default.
						-- Will probably slow down some aspects of the sorter, but can make color highlights.
						-- I will work on this more later.
						use_highlighter = true,
					},
				}
			}
		end,
		config = function()
			require('telescope').load_extension('fzf')
			require("telescope").load_extension("undo")
			require('telescope').load_extension('lsp_handlers')

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
		end,
	},
	{
		'stevearc/dressing.nvim',
		init = function()
			require('dressing').setup()
		end,
	},
}
