let s:promptW = 0
let s:displayW = 0
let s:promptB = 0
let s:displayB = 0
let s:displayLines = 10

function! FuzzyClose() abort
	" Window Closing
		call nvim_win_close(s:displayW,v:true)
		call nvim_win_close(s:promptW,v:true)
endfun
function! FuzzyEnter(sink) abort
	" Sink running
		call nvim_set_current_win(s:displayW)
		call a:sink(nvim_get_current_line())
	" Window Closing
		call nvim_win_close(s:displayW,v:true)
		call nvim_win_close(s:promptW,v:true)
endfun
function! TestSource(query) abort
	return split(system("fd | fzy  -e '" . a:query . "'" ),"\n")
endfun
function! TestSink(result) abort
	echo a:result
endfun
function! FuzzyInit(source, sink) abort
	" Window Initiation and display of source
		exe s:displayLines . "split"
		let s:displayW = nvim_get_current_win()
		let s:displayB = nvim_create_buf(v:false, v:true)
		call nvim_win_set_buf(s:displayW,s:displayB)
		call nvim_buf_set_lines(s:displayB,0,nvim_buf_line_count(s:displayB),v:true,a:source(""))
		let s:splitBelowNeedToggle = 0
		if !&splitbelow
			set splitbelow
			let s:splitBelowNeedToggle = 1
		endif
		1split
		let s:promptW = nvim_get_current_win()
		let s:promptB = nvim_create_buf(v:false,v:true)
		call nvim_win_set_buf(s:promptW,s:promptB)
		call nvim_buf_set_keymap(s:promptB,'i','<CR>',':call FuzzyEnter(function("'. a:sink .'"))<CR>',{})
		call nvim_buf_set_keymap(s:promptB,'i','<ESC>',':call FuzzyClose()<CR>',{})
		call feedkeys("i")
		call compe#setup({'enabled': v:false},0)
		if s:splitBelowNeedToggle == 1
			set nosplitbelow
		endif
endfun


