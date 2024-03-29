vim.api.nvim_set_keymap('n', '<Space>', '', {})
vim.api.nvim_set_keymap('n', ',', '', {})

vim.api.nvim_set_keymap('n', 'B', '^', { noremap = true })
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = true })
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', ':noh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>a', 'GVgg', { noremap = true })
vim.api.nvim_set_keymap('n', '<BS>', 'za', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><leader>l', ':setlocal rnu!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ';+', '<C-w>+', { noremap = true })
vim.api.nvim_set_keymap('n', ';-', '<C-w>-', { noremap = true })
vim.api.nvim_set_keymap('n', ';<', '<C-w><', { noremap = true })
vim.api.nvim_set_keymap('n', ';=', '<C-w>=', { noremap = true })
vim.api.nvim_set_keymap('n', ';>', '<C-w>>', { noremap = true })
vim.api.nvim_set_keymap('n', ';H', '<C-w>H', { noremap = true })
vim.api.nvim_set_keymap('n', ';J', '<C-w>J', { noremap = true })
vim.api.nvim_set_keymap('n', ';K', '<C-w>K', { noremap = true })
vim.api.nvim_set_keymap('n', ';L', '<C-w>L', { noremap = true })
vim.api.nvim_set_keymap('n', ';P', '<C-w>P', { noremap = true })
vim.api.nvim_set_keymap('n', ';R', '<C-w>R', { noremap = true })
vim.api.nvim_set_keymap('n', ';S', '<C-w>S', { noremap = true })
vim.api.nvim_set_keymap('n', ';T', '<C-w>T', { noremap = true })
vim.api.nvim_set_keymap('n', ';W', '<C-w>W', { noremap = true })
vim.api.nvim_set_keymap('n', ';]', '<C-w>]', { noremap = true })
vim.api.nvim_set_keymap('n', ';^', '<C-w>^', { noremap = true })
vim.api.nvim_set_keymap('n', ';_', '<C-w>_', { noremap = true })
vim.api.nvim_set_keymap('n', ';b', '<C-w>b', { noremap = true })
vim.api.nvim_set_keymap('n', ';c', '<C-w>c', { noremap = true })
vim.api.nvim_set_keymap('n', ';d', '<C-w>d', { noremap = true })
vim.api.nvim_set_keymap('n', ';f', '<C-w>f', { noremap = true })
vim.api.nvim_set_keymap('n', ';F', '<C-w>F', { noremap = true })
vim.api.nvim_set_keymap('n', ';g_', '<C-w>g_', { noremap = true })
vim.api.nvim_set_keymap('n', ';g]', '<C-w>g]', { noremap = true })
vim.api.nvim_set_keymap('n', ';g}', '<C-w>g}', { noremap = true })
vim.api.nvim_set_keymap('n', ';gf', '<C-w>gf', { noremap = true })
vim.api.nvim_set_keymap('n', ';gF', '<C-w>gF', { noremap = true })
vim.api.nvim_set_keymap('n', ';gt', '<C-w>gt', { noremap = true })
vim.api.nvim_set_keymap('n', ';gT', '<C-w>gT', { noremap = true })
vim.api.nvim_set_keymap('n', ';g<Tab>', '<C-w>g<Tab>', { noremap = true })
vim.api.nvim_set_keymap('n', ';h', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', ';i', '<C-w>i', { noremap = true })
vim.api.nvim_set_keymap('n', ';j', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', ';k', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', ';l', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', ';n', '<C-w>n', { noremap = true })
vim.api.nvim_set_keymap('n', ';o', '<C-w>o', { noremap = true })
vim.api.nvim_set_keymap('n', ';p', '<C-w>p', { noremap = true })
vim.api.nvim_set_keymap('n', ';q', '<C-w>q', { noremap = true })
vim.api.nvim_set_keymap('n', ';r', '<C-w>r', { noremap = true })
vim.api.nvim_set_keymap('n', ';s', '<C-w>s', { noremap = true })
vim.api.nvim_set_keymap('n', ';t', '<C-w>t', { noremap = true })
vim.api.nvim_set_keymap('n', ';v', '<C-w>v', { noremap = true })
vim.api.nvim_set_keymap('n', ';x', '<C-w>x', { noremap = true })
vim.api.nvim_set_keymap('n', ';z', '<C-w>z', { noremap = true })
vim.api.nvim_set_keymap('n', ';|', '<C-w>|', { noremap = true })
vim.api.nvim_set_keymap('n', ';}', '<C-w>}', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':term bash --rcfile ~/.config/vim-term.sh<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', 'g<C-g>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-BS>', '<C-W>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-/>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-_>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-/>', '<nop>', {})

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"_d', { noremap = true })
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>d', '"_d', { noremap = true })

vim.keymap.set('n', '<leader><leader>s', '<cmd>luafile ~/.config/nvim/no_plugins_init.lua<CR>')
