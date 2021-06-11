function! GDBBreakpointLaunch() abort
	let s:cond = input("Condition > ")
	let s:cmd = input("Command > ")
	let s:line = line('.')
	let s:file = expand('%:p')
	echo "\n"
	let s:prompt = "break " . s:file . ":". s:line
	if len(s:cond) > 0
		let s:prompt = s:prompt . " if " . s:cond
	endif
	let s:prompt = s:prompt . "\ncommand\n" . s:cmd . "\nend\n"
	lua require("harpoon.term").sendCommand(1, vim.api.nvim_eval('s:prompt'))
endfunction

nnoremap <leader><cr> :call GDBBreakpointLaunch()<CR>
