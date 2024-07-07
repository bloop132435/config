-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
	group = 'YankHighlight',
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
	end
})

-- automatically detect file change
augroup('FileUpdate', { clear = true })
autocmd({ 'BufEnter', 'FocusGained', 'BufEnter', 'FocusLost', 'WinLeave', 'WinEnter' }, {
	group = 'FileUpdate',
	command = "checktime"
})

-- set .h files to c filetype
augroup('HFileType', { clear = true })
autocmd({ 'BufRead', 'BufNew' }, {
	group = 'HFileType',
	pattern = { "*.h" },
	command = "set ft=c"
})

-- set .v files to verilog filetype
augroup('VFileType', { clear = true })
autocmd({ 'BufRead', 'BufNew' }, {
	group = 'VFileType',
	pattern = { "*.v" },
	command = "set ft=verilog"
})
