return {
	{
		'dracula/vim',
		init = function(x)
			vim.cmd [[colo dracula]]
			vim.cmd [[hi Pmenu guibg=#181a26]]
			vim.cmd [[hi Normal guibg=none]]
			vim.cmd [[hi SignColumn guibg=none]]
			vim.cmd [[highlight WinSeparator ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#f8f8f2 ]]
		end
	},
}
