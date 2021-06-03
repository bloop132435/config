local M = {}
local function t(str)
	return vim.api.nvim_replace_termcodes(str,true,true,true)
end

M.toggle = function(name, mode, lhs, initial_action, final_action, options)
	vim.cmd("function T"..name ..[[Start()\n
		nnoremap ]] .. t(lhs) .. " " .. t(initial_action) ..[[ :call T]] ..name .. [[End()]] .. t("<CR>") .. [[\n
	endfunction]])
	vim.cmd("function T"..name ..[[End()\n
		nnoremap ]] .. t(lhs) .. " " .. t(final_action) ..[[ :call T]] ..name .. [[Start()]] .. t("<CR>") .. [[\n
	endfunction]])
	vim.api.nvim_set_keymap(mode, lhs, ":call T"..name .."Start()" .. t("<CR>") ,options)
end


return M
