vim.g.coq_settings = {
	["keymap.recommended"] = false,
	["display.preview.border"] = "rounded",
}
vim.cmd([[inoremap <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]])
vim.cmd([[inoremap <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]])
vim.cmd([[inoremap <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"]])
vim.cmd([[inoremap <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]])
vim.cmd([[COQnow]])
