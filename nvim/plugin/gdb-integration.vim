function! GDBBreakpointLaunch() abort
	let s:cond = input("Condition > ")
	let s:cmd = input("Command > ")
	let s:line = line('.')
	let s:file = expand('%:p')
	echo "\n"
	echo "break "s:file . ":".s:line. " if " . s:cond . "\ncommand \n" . s:cmd . "\nend"
endfunction

nnoremap <leader><cr> :call GDBBreakpointLaunch()<CR>
