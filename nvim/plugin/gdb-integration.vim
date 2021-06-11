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
	lua require("harpoon.term").sendCommand(1, vim.api.nvim_eval('s:prompt'))
endfunction

function! GDBEnterMode() abort
	"Break Point
	nnoremap b :call GDBBreakpoint()<CR>
	"Continue
	nnoremap c :lua require("harpoon.term").sendCommand(1, "continue\n")<CR>
	"Printing
	nnoremap p :lua require("harpoon.term").sendCommand(1, "print " .. vim.fn.input("What to print > ") .. "\n" )<CR>
endfunction

function! GDBLeaveMode() abort
	nunmap b
	nunmap c
	nunmap p
endfunction

" nnoremap <leader><cr> :call GDBBreakpointLaunch()<CR>
