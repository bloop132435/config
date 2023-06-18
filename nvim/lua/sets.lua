vim.opt.compatible = false

vim.g.mapleader = ' '
vim.g.localleader = ','

vim.opt.shell = 'bash'

vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.cindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.signcolumn = 'yes'
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.showmode = true
vim.opt.autowriteall = true
vim.opt.inccommand = 'split'
vim.opt.exrc = true
vim.opt.emoji = false
vim.opt.scrolloff = 8
vim.opt.gdefault = true
vim.opt.completeopt = {'menuone','noselect'}
vim.opt.path:append('**')
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.encoding = 'utf8'
vim.opt.showtabline = 0
vim.opt.ve = {'block','insert'}
vim.opt.mps:append('<:>')
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.cmdheight = 2
vim.opt.ignorecase = true
vim.opt.updatetime = 300
vim.opt.splitright = true
vim.opt.wildmode = {'longest:full','full'}
vim.opt.wildignorecase = true
vim.opt.swapfile = false
vim.opt.smartcase = true
vim.opt.backup = false
vim.opt.undodir = '/Users/gqian/.vim/undodir/'
vim.opt.undofile = true
vim.opt.scrollback = 100000
vim.opt.lazyredraw = true
vim.g.python_highlight_all = 1
vim.opt.list = true
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldminlines = 25
vim.opt.foldnestmax = 3
vim.opt.fillchars = {
	eob = ' ',
	fold = '-',
	horiz			= '═' ,
	horizup			= '╩' ,
	horizdown		= '╦' ,
	vert			= '║' ,
	vertleft		= '╣' ,
	vertright		= '╠' ,
	verthoriz		= '╬' ,
}
vim.opt.ruler = false
vim.api.nvim_create_autocmd({"TermOpen","TermEnter"}, {command = "setlocal ft=term"})

vim.opt.laststatus = 3
