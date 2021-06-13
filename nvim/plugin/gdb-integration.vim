function! GDBBreakpoint() abort
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
	call TermDebugSendCommand(s:prompt)
endfunction

