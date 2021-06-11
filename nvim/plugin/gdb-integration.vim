let s:buf = 0
let s:win = 0
function! FloatingInputProcess(prompt, buffer) abort
	let s:line = split(nvim_buf_get_lines(a:buffer,0,1,v:true)[0],'\zs')
	let s:ignorefirst = len(a:prompt)
	let s:result =  join(s:line[s:ignorefirst:],'')
	echo s:result
endfunction
function! FloatingInput(prompt, processor) abort
	let s:buf = nvim_create_buf(v:false,v:true)
	let s:win = nvim_open_win(s:buf,v:true,{
				\ 'relative':'cursor',
				\ 'width':75,
				\ 'height':1,
				\ 'focusable': v:false,
				\ 'style':'minimal',
				\ 'border':'single',
				\ 'row':0,
				\ 'col':0,
				\})
	call nvim_buf_set_lines(s:buf,0,1,v:true,[a:prompt])
	call nvim_buf_set_keymap(s:buf,'i','<esc>',':q!<CR>',{'silent':v:true,'noremap':v:true})
	call nvim_buf_set_keymap(s:buf,'i','<cr>',':call ' . a:processor . '("' . a:prompt . '", '. s:buf . ')<CR>:q!<CR>',{'silent':v:true,'noremap':v:true,})
	call feedkeys('A','n')
endfunction
nnoremap <leader><cr> :call FloatingInput("P>","FloatingInputProcess")<CR>
