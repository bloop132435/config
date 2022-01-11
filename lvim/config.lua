--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dracula"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- Tab settings
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.inccommand = "split"
-- add your own keymapping
lvim.builtin.dashboard.active = false
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.luasnip = false
lvim.builtin.friendly_snippets = false
lvim.plugins = {
	{"bloop132435/dracula.nvim"},
	{"bloop132435/ultisnips"},
	{"github/copilot.vim"},
	{"hrsh7th/cmp-copilot"},
}
lvim.keys.insert_mode["<C-j>"] = false
lvim.keys.insert_mode["<C-k>"] = false
vim.cmd([[
	packadd termdebug
	let g:termdebug_wide = 163
]])
vim.cmd([[
	let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger='<c-k>'
	let g:UltiSnipsJumpForwardTrigger='<c-j>'
  ]])

lvim.keys.normal_mode["<space>f"] = false
lvim.keys.normal_mode = {
	[";k"] = "<C-W>k",
	[";l"] = "<C-W>l",
	[";j"] = "<C-W>j",
	[";h"] = "<C-W>h",
	[";v"] = "<C-W>v",
	[";s"] = "<C-W>s",
	["<space>1"] = ":BufferGoto 1<CR>",
	["<space>2"] = ":BufferGoto 2<CR>",
	["<space>3"] = ":BufferGoto 3<CR>",
	["<space>4"] = ":BufferGoto 4<CR>",
	["<space>5"] = ":BufferGoto 5<CR>",
	["<space>6"] = ":BufferGoto 6<CR>",
	["<space>7"] = ":BufferGoto 7<CR>",
	["<space>8"] = ":BufferGoto 8<CR>",
	["<space>9"] = ":BufferGoto 9<CR>",
	["<C-p>"] = ":Telescope find_files theme=get_ivy hidden=true<CR>",
	["<C-f>"] = ":Telescope current_buffer_fuzzy_find theme=get_ivy<CR>",
	["<C-l>"] = ":Telescope loclist theme=get_ivy<CR>",
	["<C-q>"] = ":Telescope quickfix theme=get_ivy<CR>",
	["<C-h>"] = ":Telescope help_tags theme=get_ivy<CR>",
	["<space>fc"] = ":Telescope find_files theme=get_ivy hidden=true cwd=~/programs/lib<CR>",
  	["<space>fd"] = ":Telescope find_files theme=get_ivy hidden=true cwd=~/.config<CR>",
	["<C-n>"] = ":NvimTreeToggle<CR>",
}
