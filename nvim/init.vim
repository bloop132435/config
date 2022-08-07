" Plugins{{{
"be sure to install Vim Plug
call plug#begin('~/.vim/plugged')
" p-lua {{{
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-lua/plenary.nvim'

"}}}
" p-Language_Support {{{
		Plug 'bloop132435/ultisnips'
		Plug 'antoinemadec/coc-fzf'
		Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install'}

" }}}
" p-Looks {{{
		Plug 'bloop132435/dracula.nvim', {'branch':'main'}
		Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'} "Tree sitter
		Plug 'akinsho/nvim-bufferline.lua'
		Plug 'folke/zen-mode.nvim'
		Plug 'b0o/incline.nvim'
		Plug 'lukas-reineke/indent-blankline.nvim'
		Plug 'abhishekmukherg/xonsh-vim'

"}}}
" p-Finders {{{
		Plug 'phaazon/hop.nvim'  "easy motion but for nvim
		Plug 'wincent/loupe' "better incsearch for vim
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'

		"}}}
" p-Git {{{
		" Plug 'kdheepak/lazygit.nvim' "lazy git integration for neovim
		" Plug 'tpope/vim-fugitive'

"}}}
" p-Misc {{{
		Plug 'machakann/vim-sandwich'  "surround
		Plug 'winston0410/commented.nvim'
		Plug 'mbbill/undotree'
		Plug 'wellle/targets.vim'  "nicer i and a motions
		Plug 'dstein64/vim-startuptime' "Startuptime logging
		Plug 'steelsojka/pears.nvim'
		Plug 'simeji/winresizer'
		Plug 'gukz/ftFt.nvim'
		Plug 'nikvdp/neomux'

"}}}
" p-Testing {{{
	Plug 'abecodes/tabout.nvim'
	Plug 'famiu/bufdelete.nvim'
	Plug 'github/copilot.vim'
	Plug 'kevinhwang91/nvim-bqf'
	Plug 'dense-analysis/ale'
	Plug 'mtth/scratch.vim'
	Plug 'mcchrish/nnn.vim'
	Plug 'djoshea/vim-autoread'
	Plug 'folke/todo-comments.nvim'


" }}}
call plug#end()

" }}}
" Vanilla_Vim {{{
	set nocompatible " disable Vi compatibility

	nnoremap <Space> <nop>
	nnoremap , <nop>
	let mapleader = ' '
	let localleader=','
	set shell=bash

	syntax on
	filetype on
	filetype plugin on
	filetype indent on

	set termguicolors
	highlight Pmenu ctermbg=gray

	set shiftwidth=4 softtabstop=4 tabstop=4 " default indent w/ 2 spaces
	set cindent
	set autoindent
	set smartindent smarttab

	set signcolumn=yes
	set relativenumber number

	set nowrap
	set showmode
	set autowriteall
	set inccommand=split
	set exrc
	set noemoji
	set scrolloff=4
	set gdefault
	set completeopt=menuone,noselect
	set path+=**
	set hidden
	set clipboard+=unnamedplus
	set mouse=a " enable mouse
	set encoding=utf8
	set showtabline=0
	set wildchar=<tab> wildmenu wildmode=longest,list,full " auto complete menus
	set wildcharm=<c-z> " like wildchar, but for use in macros
	set ve=block,insert
	set mps+=<:>
	set backspace=indent,eol,start " fix backspace
	set belloff=all
	set nohlsearch
	set incsearch
	set cmdheight=2
	set ignorecase
	set updatetime=300
	set splitright
	set wildmode=longest:full,full
	set wildignorecase
	set noswapfile
	set smartcase
	set nobackup
	set undodir=~/.vim/undodir
	set undofile
	set scrollback=100000
	set lazyredraw
	au GUIEnter * simalt ~x
	let python_highlight_all = 1
	set list
	set listchars=tab:\|\ ,nbsp:∙
	hi Normal guibg=NONE ctermbg=NONE

	"nice auto groups
	"save when writing .vim files and the like
	augroup sourcing
		au!
		au! BufWritePost init.vim source $MYVIMRC
		au! BufWritePost *.vim source  $MYVIMRC
	augroup END

	set foldmethod=expr
	set foldexpr=nvim_treesitter#foldexpr()
	set foldminlines=10
	set foldnestmax=3
	augroup folding
		au!
		autocmd filetype vim setlocal foldmethod=marker
		autocmd filetype vim setlocal foldminlines=1
		au Filetype tmux setlocal foldmethod=marker
	augroup END
	set guifont=JetBrainsMono\ NF:h11
	set fillchars=eob:\ ,
	set mouse=a
	set ruler
	fun! TrimWhitespace()
		let l:save = winsaveview()
		keeppatterns %s/\s\+$//e
		call winrestview(l:save)
	endfun
	augroup trimwhitespace
		autocmd!
		au BufWritePre * call TrimWhitespace()
	augroup END
	set mouse=a
	set ruler
	augroup custom
		autocmd!
		autocmd BufWinEnter COMMIT_EDITMSG set nobuflisted
		autocmd BufWinEnter ~/.config/polybar/config set ft=dosini
	augroup END

	augroup terminal
		au!
		au TermEnter * setlocal ft=term
		au TermOpen * setlocal ft=term
	augroup END

	set fillchars=fold:\-

" }}}
" Vanilla_Vim_Mappings {{{
	nnoremap B ^
	nnoremap E $
	nnoremap U <C-r>
	nnoremap  <esc> :noh<CR>
	nnoremap <leader><leader>a GVgg
	nmap <BS> za
	nmap <leader><leader>s :so $MYVIMRC<CR>
	nnoremap Y y$
	nnoremap <leader><leader>a GVgg
	let b:fold = v:true
	nnoremap <leader>q :setlocal foldlevel=5<CR>
	let w:rnu = v:true
	function! ToggleLine() abort
		if !exists('w:rnu')
			let w:rnu = v:true
		endif
		if w:rnu == v:true
			let w:rnu = v:false
			setlocal norelativenumber
		else
			let w:rnu = v:true
			setlocal relativenumber
		endif
	endfunction
	nnoremap <silent> <leader>l :call ToggleLine()<CR>
	" augroup lineNumberVarSet
	" 	au!
	" 	augroup Winenter *  let w:rnu = v:true
	" augroup END
	" Window Navigation {{{
	nnoremap ;+       <C-w>+
	nnoremap ;-       <C-w>-
	nnoremap ;<       <C-w><
	nnoremap ;=       <C-w>=
	nnoremap ;>       <C-w>>
	nnoremap ;H       <C-w>H
	nnoremap ;J       <C-w>J
	nnoremap ;K       <C-w>K
	nnoremap ;L       <C-w>L
	nnoremap ;P       <C-w>P
	nnoremap ;R       <C-w>R
	nnoremap ;S       <C-w>S
	nnoremap ;T       <C-w>T
	nnoremap ;W       <C-w>W
	nnoremap ;]       <C-w>]
	nnoremap ;^       <C-w>^
	nnoremap ;_       <C-w>_
	nnoremap ;b       <C-w>b
	nnoremap ;c       <C-w>c
	nnoremap ;d       <C-w>d
	nnoremap ;f       <C-w>f
	nnoremap ;F       <C-w>F
	nnoremap ;g_      <C-w>g_
	nnoremap ;g]      <C-w>g]
	nnoremap ;g}      <C-w>g}
	nnoremap ;gf      <C-w>gf
	nnoremap ;gF      <C-w>gF
	nnoremap ;gt      <C-w>gt
	nnoremap ;gT      <C-w>gT
	nnoremap ;g<Tab>  <C-w>g<Tab>
	nnoremap ;h       <C-w>h
	nnoremap ;i       <C-w>i
	nnoremap ;j       <C-w>j
	nnoremap ;k       <C-w>k
	nnoremap ;l       <C-w>l
	nnoremap ;n       <C-w>n
	nnoremap ;o       <C-w>o
	nnoremap ;p       <C-w>p
	nnoremap ;q       <C-w>q
	nnoremap ;r       <C-w>r
	nnoremap ;s       <C-w>s
	nnoremap ;t       <C-w>t
	nnoremap ;v       <C-w>v
	nnoremap ;x       <C-w>x
	nnoremap ;z       <C-w>z
	nnoremap ;bar     <C-w>bar
	nnoremap ;}       <C-w>}
	"}}}
	" nnoremap <silent> <C-t> :term bash --rcfile ~/.config/vim-term.sh<CR>
	nnoremap <silent>  <C-t> :Neomux<CR>
	nnoremap <silent> <leader>t :term bash --rcfile ~/.config/vim-term.sh<CR>
	nnoremap <C-g> g<C-g>

	inoremap  <C-W>
	tnoremap <C-/> <C-\><C-n>
	nnoremap <C-/> <nop>
	tnoremap <C-_> <C-\><C-n>
	" TODO, make this work for other end deliminters ],},",'
	" inoremap  <C-[>f)a

	vnoremap < <gv
	vnoremap > >gv
	vnoremap <BS> zf
	vnoremap <leader><leader>d "_d
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv

	"Text Objects
	vnoremap al :<C-u>silent! normal! 0v$<CR>
	omap al :normal val<CR>
	vnoremap il :<C-u>silent! normal! 0v$h<CR>
	omap il :normal val<CR>


"}}}
" AsyncRun {{{
	"running files in cpp,java,python
	let g:asyncrun_open = 8
	let g:asyncrun_stdin = 3
	augroup comp
		au!
		autocmd filetype cpp nnoremap <F8> :w<CR> :AsyncRun-mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time compile %:t:r<CR><CR>
		autocmd filetype cpp nnoremap <F9> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time build %:t:r<CR><CR>
		autocmd filetype python nnoremap <F5> :w<CR> :AsyncRun  -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent  time python %<CR><CR>
		autocmd filetype java nnoremap <F4> :w<CR> :AsyncRun     -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time javac *.java<CR>
		autocmd filetype java nnoremap <F5> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time java %:t:r<CR><CR>
		autocmd filetype cpp nnoremap <F5> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time ./x%:t:r.out <CR><CR>
		autocmd filetype cpp nnoremap <F4> :w<CR> :AsyncRun  -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time  ./x%:t:r.out < in<CR><CR>
		autocmd filetype sh nnoremap <f5> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time bash %<cr>
	augroup END

"}}}
" Bracket Pairs {{{
lua <<EOF
--require"pears".setup()
EOF
" }}}
" Bufdelete {{{
	nnoremap <silent> <leader>bd :lua require'bufdelete'.bufdelete(0,true)<CR>

" }}}
" COC {{{
	nmap ,r <Plug>(coc-rename)
	nnoremap <silent> <leader>r :CocRestart<CR>
	nnoremap <silent> ,o :CocFzfList outline <CR>
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gr <Plug>(coc-references)
	nmap <silent> ,f <Plug>(coc-references)
	nnoremap <silent> ,a :CocFzfList actions<CR>
	nnoremap <silent> ,y :CocFzfList yank<CR>
	nnoremap <silent> ,d  :CocFzfList diagnostics --current-buf<CR>
	nnoremap <silent> ,k  :CocFzfList diagnostics <CR>
	inoremap <silent> <C-s> :call CocActionAsync('showSignatureHelp')<CR>
	nnoremap <silent> <C-s> :call CocActionAsync('showSignatureHelp')<CR>
	nnoremap <silent> <C-k> :call coc#float#scroll(1,10)<CR>
	nnoremap <silent> <C-j> :call coc#float#scroll(2,10)<CR>
	inoremap <silent><expr> <c-b> coc#refresh()
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	nmap <silent> ,c <plug>(coc-codeaction)
	nnoremap <silent> ,s :CocDiagnostics<CR>
	nnoremap <silent> [c :copen<CR>
	nnoremap <silent> [q :cclose<CR>
	nnoremap <silent> [n :cnext<CR>
	nnoremap <silent> [p :cprevious<CR>

	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	function! s:show_documentation()
	  if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	  else
		call feedkeys('K', 'in')
	  endif
	endfunction
	let g:coc_global_extensions = ['coc-word','coc-ultisnips-select','coc-ultisnips','coc-marketplace','coc-vimlsp','coc-pyright','coc-json','coc-clangd','coc-yank','coc-java','coc-fzf-preview','coc-rust-analyzer','coc-gitignore','coc-pairs','coc-hls']
	let g:python3_host_prog = '/opt/homebrew/Caskroom/miniforge/base/bin/python3.9'

" }}}
" Color Schemes {{{
	colo dracula
	set background=dark
	hi OverRuler  guibg=#cc241d
	call matchadd('OverRuler', '\v^.{200}\zs.*$', 100)
	hi Normal guibg=NONE ctermbg=NONE
	hi Folded guibg=NONE guifg=#80a0ff
	hi WinSeparator guibg=NONE ctermbg=NONE
	hi LineNr guifg=#F8F8F2

" }}}
" Copilot {{{
	imap <silent><script><expr> <C-r> copilot#Accept("\<C-r>")
	let g:copilot_no_tab_map = v:true
	let g:copilot_active = v:true
	function! ToggleCopilot() abort
		if g:copilot_active == v:true
			let g:copilot_active = v:false
			Copilot disable
			echo 'copilot disable'
		else
			let g:copilot_active = v:true
			Copilot enable
			echo 'copilot enable'
		endif
	endfunction
	nnoremap <silent> <leader>c :call ToggleCopilot()<CR>

" }}}
" Comment {{{
	lua require("commented").setup()
	nnoremap <silent> gcc :Comment<CR>
	vnoremap <silent> gc :Comment<CR>
	"lua require('nvim_comment').setup()
" }}}
" Finders {{{
	let g:loaded_netrwPlugin = 0
	let g:nnn#set_default_mappings = 0
	nnoremap <C-n> :NnnPicker<CR>
	nnoremap <leader>n :NnnPicker %:p:h <CR>


	command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>
	let $FZF_DEFAULT_COMMAND="fd -E .git/ -H -L  --strip-cwd-prefix""
	nnoremap <silent> <C-p> :call fzf#vim#files('.',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <C-f> :call fzf#vim#buffer_lines({'options':'--no-preview'})<CR>
	nnoremap <silent> <C-r> :Rg<CR>
	nnoremap <silent> <C-b> :Buffers<CR>
	nnoremap <silent> <leader>. :Buffers<CR>
	nnoremap <silent> <C-h> :Helptags<CR>


	nnoremap <silent> <leader>fp :call fzf#vim#files('.',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fl :call fzf#vim#buffer_lines({'options':'--no-preview'})<CR>
	nnoremap <silent> <leader>fb :Buffers<CR>
	nnoremap <silent> <leader>fc :call fzf#vim#files('~/OneDrive/Programs',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fd :call fzf#vim#files('~/.config',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fh :Helptags<CR>

	nnoremap <C-'> :call CurrentFileFile()<CR>
	function! CurrentFileFile() abort
		execute 'call fzf#vim#files("' . expand('%:h') . '",{"options":"--preview `~/.config/nvim/preview.sh {}`"})'
	endfunction


    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
	  \ 'ctrl-v': 'vsplit'}


	let g:fzf_layout = {'window':{'width':1, 'height':0.4,'xoffset':0,'yoffset':0}}

    " let g:fzf_colors =
    " \ { 'fg':      ['fg', 'Normal'],
    "   \ 'bg':      ['bg', 'Normal'],
    "   \ 'hl':      ['fg', 'Comment'],
    "   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    "   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    "   \ 'hl+':     ['fg', 'Statement'],
    "   \ 'info':    ['fg', 'PreProc'],
    "   \ 'border':  ['fg', 'Ignore'],
    "   \ 'prompt':  ['fg', 'Conditional'],
    "   \ 'pointer': ['fg', 'Exception'],
    "   \ 'marker':  ['fg', 'Keyword'],
    "   \ 'spinner': ['fg', 'Label'],
    "   \ 'header':  ['fg', 'Comment'] }

" }}}
" ftFT {{{
	lua require('ftFT').setup()
" }}}
" Git {{{
	let $GIT_EDITOR = "nvr -cc split --remote-wait "
	nmap <silent> <leader>gg :LazyGit<CR>
	nnoremap <silent> <leader>gd :Gdiffsplit!<CR>
	nnoremap <silent> <leader>gf :diffget //2<CR>
	nnoremap <silent> <leader>gj :diffget //3<CR>


" }}}
" Hop {{{
	lua require'hop'.setup()
	nnoremap <leader>h  :HopWord<CR>
	nnoremap <leader>H :HopPattern<CR>
	highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold
	highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold
	highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33
	highlight default HopUnmatched guifg=#666666 ctermfg=242

"}}}
" Indent Guides {{{
lua << EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF
highlight IndentBlanklineContextChar guifg=#bd93f9

" }}}
" Jupyter_Notebook {{{
	let g:nvim_ipy_perform_mappings = 0
	command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")
	let g:ipy_celldef = '^# %%.*$'
	function OpenPythonNotebook()
		let s:rootname = expand("%:r")
		let s:pythonfile = s:rootname . ".py"
		let s:notebookfile = expand("%")
		echo s:pythonfile
		silent exe "!ntop " . expand("%") . " " . s:pythonfile
		silent exe "e " . s:pythonfile
		set ft=python
	endfunction
	augroup ipynb
		au!
		au BufRead *.ipynb call OpenPythonNotebook()
	augroup END

	nmap <silent> <leader>jq :RunQtConsole<CR>
	nmap <silent> <leader>jk :IPython<Space>--existing<Space>--no-window<CR>
	nmap <silent> <leader>jc <Plug>(IPy-RunCell)
	nmap <silent> <leader>ja <Plug>(IPy-RunAll)
	let g:jupytext_enable = 1
	let g:jupytext_fmt = 'py'
	let g:jupytext_filetype_map = {'py':'python'}
" }}}
" Maximizer {{{
	nnoremap <silent> <leader>m :MaximizerToggle!<CR>

" }}}
" Markdown {{{
	let g:markdown_fenced_languages =	['html', 'python', 'ruby', 'vim', 'cpp', 'java', 'bash', 'sh', '']
	function! Dedent() abort
		let l = line('.')
		let tail = matchstr(getline(l),"^.\\zs.*$")
		call setline(l,tail)
	endfunction
	inoremap <silent>  <cmd>call Dedent()<CR>
	augroup markdown
		au!
        autocmd Filetype markdown setlocal comments=n:*,n:-\ [\ ],n:-
        autocmd Filetype markdown setlocal formatoptions=ctnqro
	augroup END

" }}}
" Neomux {{{
	let g:neomux_start_term_map = ''
	let g:neomux_start_term_split_map = ''
	let g:neomux_start_term_vsplit_map = ''
	let g:neomux_winjump_map_prefix = ''
	let g:neomux_default_shell = 'bash'
" }}}
" Python autoimport {{{

	function! s:PyPostSave()
		execute "silent !tidy-imports --quiet --replace-star-imports --action REPLACE " . bufname("%")
		execute "e"
	endfunction

	:command! PyPostSave :call s:PyPostSave()


" }}}
" Snippets {{{
	let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger='<c-k>'
	let g:UltiSnipsJumpForwardTrigger='<c-j>'

"}}}
"  Statusline {{{
	set laststatus=3
	hi Statusline guibg=None ctermbg=None
	hi StatuslineNC guibg=None ctermbg=None
	hi StatuslineTerm guibg=None ctermbg=None
	hi StatuslineTermNC guibg=None ctermbg=None

lua <<EOF
require('incline').setup({
	render = function(props)
		local bufname = vim.api.nvim_buf_get_name(props.buf)
		local res = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
		local winr = 0
		for i=1,vim.fn.tabpagewinnr(1,'$') do
			if vim.fn.win_getid(i)==props.win then
				winr = i
			end
		end
		res = res .. ' {' .. winr .. '}'
		if vim.api.nvim_buf_get_option(props.buf, 'modified') then
			res = res .. ' [+]'
		end
		return res
	end,
})
EOF
" }}}
"  Tresitter {{{
lua << EOF
require'nvim-treesitter.configs'.setup{
	ensure_installed = {"c","cpp","python","java","bash"},
	highlight = {
		enable = true,
	},
	conext_commentstring = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	},
	indent = {
		enable = false,
	},
}
EOF

" }}}
" Tabline {{{
	lua <<EOF
	require('bufferline').setup {
	  options = {
		numbers = function(opts)
		return string.format('%s.', opts.ordinal )
		end,
		--mappings = true,

		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
			return vim.fn.fnamemodify(buf.name, ':t')
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
		  return "("..count..")"
		end,
		show_buffer_icons = false,
		show_buffer_close_icons =false,
		show_close_icon = false,
		show_tab_indicators = false,
		persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = 'id',  }
	}

EOF

nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
" }}}
" Tabout {{{
lua <<EOF
    require('tabout').setup {
    tabkey = '<C-l>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = false, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '', -- reverse shift default action,
    enable_backwards = true, -- well ...
    completion = false, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'},
      {open = '<', close = '>'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
EOF

" }}}
" Undo_Tree {{{
	nnoremap <silent> <leader>u :UndotreeToggle<CR>

" }}}
" Zen_Mode {{{

lua <<EOF
require'zen-mode'.setup({
  window = {
    backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    width = 170, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
       signcolumn = "yes", -- disable signcolumn
       number = true, -- disable number column
       relativenumber = true, -- disable relative numbers
       cursorline = false, -- disable cursorline
       cursorcolumn = false, -- disable cursor column
       foldcolumn = "0", -- disable fold column
       list = true, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = true, -- disables the ruler text in the cmd line area
      showcmd = true, -- disables the command in the last line of the screen
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
})
EOF
	nnoremap <silent> <leader>z :ZenMode<CR>

" }}}
" Testing {{{
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_linters = {'rust':['rustc','analyzer','rustfmt','cargo']}
let g:ale_float_preview = 1
nnoremap <silent> <leader>a :ALEToggle<CR>

nnoremap <silent> <C-S> :Scratch<CR>
let g:scratch_persistence_file = '~/.config/nvim/scratch.txt'
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }

" lua require('todo-comments').setup()
if exists("g:neovide")
		" Put anything you want to happen only in Neovide here
let g:neovide_input_use_logo=v:true
endif
"}}}
