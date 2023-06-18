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
