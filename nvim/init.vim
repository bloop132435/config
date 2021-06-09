" TITLE {{{
" NNNNNNNN        NNNNNNNN EEEEEEEEEEEEEEEEEEEEEE      OOOOOOOOO      VVVVVVVV           VVVVVVVV IIIIIIIIII MMMMMMMM               MMMMMMMM
" N:::::::N       N::::::N E::::::::::::::::::::E    OO:::::::::OO    V::::::V           V::::::V I::::::::I M:::::::M             M:::::::M
" N::::::::N      N::::::N E::::::::::::::::::::E  OO:::::::::::::OO  V::::::V           V::::::V I::::::::I M::::::::M           M::::::::M
" N:::::::::N     N::::::N EE::::::EEEEEEEEE::::E O:::::::OOO:::::::O V::::::V           V::::::V II::::::II M:::::::::M         M:::::::::M
" N::::::::::N    N::::::N   E:::::E       EEEEEE O::::::O   O::::::O  V:::::V           V:::::V    I::::I   M::::::::::M       M::::::::::M
" N:::::::::::N   N::::::N   E:::::E              O:::::O     O:::::O   V:::::V         V:::::V     I::::I   M:::::::::::M     M:::::::::::M
" N:::::::N::::N  N::::::N   E::::::EEEEEEEEEE    O:::::O     O:::::O    V:::::V       V:::::V      I::::I   M:::::::M::::M   M::::M:::::::M
" N::::::N N::::N N::::::N   E:::::::::::::::E    O:::::O     O:::::O     V:::::V     V:::::V       I::::I   M::::::M M::::M M::::M M::::::M
" N::::::N  N::::N:::::::N   E:::::::::::::::E    O:::::O     O:::::O      V:::::V   V:::::V        I::::I   M::::::M  M::::M::::M  M::::::M
" N::::::N   N:::::::::::N   E::::::EEEEEEEEEE    O:::::O     O:::::O       V:::::V V:::::V         I::::I   M::::::M   M:::::::M   M::::::M
" N::::::N    N::::::::::N   E:::::E              O:::::O     O:::::O        V:::::V:::::V          I::::I   M::::::M    M:::::M    M::::::M
" N::::::N     N:::::::::N   E:::::E       EEEEEE O::::::O   O::::::O         V:::::::::V           I::::I   M::::::M     MMMMM     M::::::M
" N::::::N      N::::::::N EE::::::EEEEEEEE:::::E O:::::::OOO:::::::O          V:::::::V          II::::::II M::::::M               M::::::M
" N::::::N       N:::::::N E::::::::::::::::::::E  OO:::::::::::::OO            V:::::V           I::::::::I M::::::M               M::::::M
" N::::::N        N::::::N E::::::::::::::::::::E    OO:::::::::OO               V:::V            I::::::::I M::::::M               M::::::M
" NNNNNNNN         NNNNNNN EEEEEEEEEEEEEEEEEEEEEE      OOOOOOOOO                  VVV             IIIIIIIIII MMMMMMMM               MMMMMMMM
" " }}}
" Plugins{{{
"be sure to install Vim Plug
call plug#begin('~/.vim/plugged')
" p-lua {{{
		Plug 'nvim-lua/popup.nvim'  "pop up api for nvim
		Plug 'nvim-lua/plenary.nvim'  "assorted functions for lua neovim

"}}}
" p-Language_Support {{{
		Plug 'neovim/nvim-lspconfig'  "nvim builtin lsp
		Plug 'glepnir/lspsaga.nvim'
		Plug 'ray-x/lsp_signature.nvim'  "function signature help for lsp
		Plug 'hrsh7th/nvim-compe'
		Plug 'bloop132435/ultisnips'

" }}}
" p-Looks {{{
		Plug 'rktjmp/lush.nvim'
		Plug 'npxbr/gruvbox.nvim'
		Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'} "Tree sitter
		Plug 'tjdevries/express_line.nvim'
		Plug 'jose-elias-alvarez/buftabline.nvim'
		Plug 'rhysd/vim-clang-format'
		Plug 'folke/todo-comments.nvim'

"}}}
" p-Finders {{{
		Plug 'phaazon/hop.nvim'  "easy motion but for nvim
		Plug 'wincent/loupe' "better incsearch for vim
		Plug 'windwp/nvim-spectre'
		Plug 'Shougo/defx.nvim'
		Plug 'kristijanhusak/defx-git'
		Plug 'liuchengxu/vim-clap'  ,{'do':':Clap install-binary!'}

		"}}}
" p-Git {{{
		Plug 'kdheepak/lazygit.nvim' "lazy git integration for neovim
		Plug 'tpope/vim-fugitive'

"}}}
" p-Misc {{{
		Plug 'machakann/vim-sandwich'  "surround
		Plug 'b3nj5m1n/kommentary'  "comments
		Plug 'simnalamburt/vim-mundo'
		Plug 'szw/vim-maximizer'  "mazimize a window
		Plug 'wellle/targets.vim'  "nicer i and a motions
		Plug 'yuttie/comfortable-motion.vim'  "smooth scroll
		Plug 'skywind3000/asyncrun.vim'  "configure things to asyncly run and spit out results
		Plug 'dstein64/vim-startuptime' "Startuptime logging
		Plug 'tversteeg/registers.nvim'
		Plug 'mtth/scratch.vim'
		Plug 'windwp/nvim-autopairs'
		Plug 'godlygeek/tabular'
		Plug 'kevinhwang91/nvim-hlslens'
		Plug 'ThePrimeagen/harpoon'
		Plug 'svermeulen/vim-subversive'
		Plug 'tpope/vim-eunuch'
		Plug 'simeji/winresizer'
		Plug 'bfredl/nvim-ipy'
		Plug 'dbeniamine/cheat.sh-vim'

"}}}
" p-Testing {{{

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
	set noshowmode
	set autowriteall
	set inccommand=split
	set exrc
	set noemoji
	set scrolloff=10
	set gdefault
	set completeopt=menuone,noselect
	set path+=**
	set hidden
	set clipboard=unnamedplus
	set mouse=a " enable mouse
	set encoding=utf8
	set laststatus=2 " always show status line
	set showtabline=0
	set wildchar=<tab> wildmenu wildmode=longest,list,full " auto complete menus
	set wildcharm=<c-z> " like wildchar, but for use in macros
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
	augroup folding
		au!
		au BufEnter kitty.conf setlocal foldmethod=marker
	augroup END
	set guifont=JetBrainsMono\ NF:h11
	set fillchars=eob:\ ,
	set foldmethod=manual
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
	augroup pythonCell
		au!
		autocmd FileType python iabbrev <buffer> cell ##o##O
	augroup END
	augroup markdown
		au!
        autocmd Filetype markdown setlocal comments=n:*,n:-\ [\ ]
        autocmd Filetype markdown setlocal formatoptions=ctnqro
	augroup END
	set mouse=a
	set ruler
	fun! TrimWhitespace()
		let l:save = winsaveview()
		keeppatterns %s/\s\+$//e
		call winrestview(l:save)
	endfun
	augroup custom
		autocmd!
		autocmd BufWritePre * :call TrimWhitespace()
		autocmd filetype vim setlocal foldmethod=marker
		autocmd FileType python iabbrev <buffer> cell ##o##O
        autocmd Filetype markdown setlocal comments=n:*,n:-\ [\ ]
        autocmd Filetype markdown setlocal formatoptions=ctnqro
		autocmd BufEnter COMMIT_EDITMSG set bufhidden
	augroup END

	function! OpenHelpInCurrentWindow(topic)
		view $VIMRUNTIME/doc/help.txt
		setl filetype=help
		setl buftype=help
		setl nomodifiable
		exe 'keepjumps help ' . a:topic
	endfunction
	command! -nargs=? -complete=help Help call OpenHelpInCurrentWindow(<q-args>)

" }}}
" Vanilla_Vim_Mappings {{{
	nnoremap B ^
	nnoremap E $
	nnoremap U <C-r>
	nnoremap <esc> :noh<CR>
	nnoremap <leader><leader>a GVgg
	nmap <BS> za
	nnoremap <C-s> :Scratch<CR>
	nmap <leader><leader>s :so $MYVIMRC<CR>
	nnoremap Y y$
	nnoremap <leader>bd :bd! %<CR>
	nnoremap <leader><leader>a GVgg
	nnoremap <leader>t :ToggleTerminal<CR>
	nnoremap j jzz
	nnoremap k kzz
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
	nnoremap ;w       <C-w>w
	nnoremap ;x       <C-w>x
	nnoremap ;z       <C-w>z
	nnoremap ;bar     <C-w>bar
	nnoremap ;}       <C-w>}

	inoremap  <C-W>

	:command Source :so $MYVIMRC

	vnoremap , <gv
	vnoremap . >gv
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
		autocmd filetype cpp nnoremap <F8> :w<CR> :AsyncRun-mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time compile %:r<CR><CR>
		autocmd filetype cpp nnoremap <F9> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time build %:r<CR><CR>
		autocmd filetype python nnoremap <F5> :w<CR> :AsyncRun  -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent  time python %<CR><CR>
		autocmd filetype java nnoremap <F4> :w<CR> :AsyncRun     -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time javac %:r.java<CR>
		autocmd filetype java nnoremap <F5> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time java %:r<CR><CR>
		autocmd filetype cpp nnoremap <F5> :w<CR> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time ./x%:r.out <CR><CR>
		autocmd filetype cpp nnoremap <F4> :w<CR> :AsyncRun  -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time  ./x%:r.out < in<CR><CR>
		autocmd filetype sh nnoremap <f5> :AsyncRun -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time bash %<cr>
	augroup END

"}}}
" Bracket Pairs {{{
lua <<EOF
require('nvim-autopairs').setup({
	check_ts = true,
})
local remap  = vim.api.nvim_set_keymap
local npairs = require'nvim-autopairs'
_G.MUtils = {}
vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~=0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"](npairs.esc("<CR>"))
		else
			return npairs.esc("<CR>")
		end
	else
		return npairs.autopairs_cr()
	end
end
remap('i','<CR>', 'v:lua.MUtils.completion_confirm()',{expr = true, noremap = true})
EOF
" }}}
" Cheat.sh {{{
	let g:CheatSheetDoNotMap = 1

" }}}
" Color Schemes {{{
	let g:gruvbox_contrast_dark = "hard"
	let g:gruvbox_italicize_comments = 0
	" let g:gruvbox_improved_strings = 1
	colo gruvbox
	set background=dark
	highlight ActiveNormal guibg=#1d2021
	highlight InactiveNormal guibg=#282828
	augroup focus
		au!
		au WinEnter * setlocal winhighlight=Normal:ActiveNormal
		au WinLeave * setlocal winhighlight=Normal:InactiveNormal
	augroup END

" }}}
" Clang_Format {{{
	let g:clang_format#detect_style_file = 1
	let g:clang_format#auto_format = 1

" }}}
" Comfortable_Motion {{{
	let g:comfortable_motion_no_default_key_mappings = 1
	nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
	nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
	nnoremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
	nnoremap <silent> <ScrollWheelUp> :call comfortable_motion#flick(-40)<CR>
"}}}
" Finders {{{
	nnoremap <silent>  :Defx `expand('%:p:h')`  -show-ignored-files<CR>

	call defx#custom#column('git','raw_mode',1)
	call defx#custom#option('_', {
		  \ 'columns': 'mark:git:filename:type:space:size:space:space:space:time',
		  \ })
	let g:__t_func_list = 4
	function DefxSettings()
		set number relativenumber
		nnoremap <silent><buffer> <CR> :call defx#call_async_action("open")<CR>
		nnoremap <silent><buffer> l :call defx#call_async_action("open")<CR>
		nnoremap <silent><buffer> <BS> :call defx#call_async_action("cd","..")<CR>
		nnoremap <silent><buffer> h :call defx#call_async_action("cd","..")<CR>

		nnoremap <silent><buffer> mk :call defx#call_async_action("new_file")<CR>
		nnoremap <silent><buffer> rm :call defx#call_async_action("remove_trash")<CR>
		nnoremap <silent><buffer> p :call defx#call_async_action("paste")<CR>
		nnoremap <silent><buffer> cp :call defx#call_async_action("copy")<CR>
		nnoremap <silent><buffer> mv :call defx#call_async_action("rename")<CR>

		nnoremap <silent><buffer> <tab> :call defx#call_async_action("toggle_select")<CR>
		vnoremap <silent><buffer>       <tab> :call defx#call_async_action("toggle_select_visual")<CR>

		nnoremap <silent><buffer> t :call defx#call_async_action('execute_command',[input("command> "),"async"])<CR>

		nnoremap <silent><buffer>  :call defx#call_async_action("quit")<CR>


	endfun
	let g:loaded_netrwPlugin = 1
	augroup Defx
		au!
		autocmd Filetype defx call DefxSettings()
	augroup END

	let g:HelpT = g:clap#provider#help_tags#
	function! HelpT.sink(line) abort
		let [tag, doc_fname] = split(a:line, "\t")
		execute 'Help ' . tag
	endfunction

	augroup ClapFiler
		au!
		au Filetype clap_input call compe#setup({'enabled': v:false},0)
		au Filetype clap_input imap  <Down>
		au Filetype clap_input imap  <Up>
	augroup END
	let g:clap_layout = {'relative':'window','width':'100%','col':'0%','height':'100%','row':'0%'}
	let g:clap_open_preview = 'never'
	let g:clap_disable_run_rooter = v:true
	let g:clap_popup_border = "sharp"
	let g:clap_search_box_border_style = "nil"
	let g:clap_default_external_filter = 'fzy'
	let g:clap_enable_icon = 0
	let g:clap_enable_background_shadow = v:false
	let g:clap_background_shadow_blend = 0
	let g:clap_insert_mode_only = v:true
	let g:clap_no_matches_msg = ""
	let g:clap_disable_bottom_top = v:true

	let g:clap_provider_grep_delay = 0
	let g:clap_provider_grep_blink = [0,0]
	let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'
	let g:clap_provider_grep_enable_icon = 0

	let g:clap_provider_yanks_history = "~/.clap_yanks"

	let g:clap_provider_buffers_cur_tab_only = v:false
	nnoremap <silent>  :Clap! files ++finder=fd -E\ .git --hidden
	nnoremap <silent>  :Clap! blines
	nnoremap <silent>  :Clap! buffers
	nnoremap <silent>  :lua require'spectre'.open()
    nnoremap <silent>  :Clap! grep
    nnoremap <silent>  :Clap! loclist
    nnoremap <silent>  :Clap! quickfix
	nnoremap <silent>  :Clap!
	nnoremap <silent>  :Clap! help_tags

	nnoremap <silent> <leader>fp :Clap! files ++finder=fd -E\ .git --hidden -I 
	nnoremap <silent> <leader>fl :Clap! blines
	nnoremap <silent> <leader>fb :Clap! buffers

	nnoremap <silent> <leader>fC :Clap!
	nnoremap <silent> <leader>ff :Clap! grep2
	nnoremap <silent> <leader>fq :Clap! quickfix
	nnoremap <silent> <leader>fc :Clap! files  ++finder=fd -E\ .git --hidden -I . '/home/gqian/programs/lib'
	nnoremap <silent> <leader>fd :Clap! files  ++finder=fd -E\ .git --hidden -I . '/home/gqian/.config/nvim'
	nnoremap <silent> <leader>fh :Clap! help_tags
	nnoremap <silent> <leader>fg :Clap! grep
	nnoremap <silent> <leader>fy :Clap! yanks
	nnoremap <silent> <leader>fr :lua require'spectre'.open()
    nnoremap <silent> <leader>fq :Clap! quickfix
" }}}
" Git {{{
	let $GIT_EDITOR = "nvr -cc split --remote-wait "
	nmap <silent> <leader>gg :LazyGit<CR>
	nnoremap <leader>gd :Gdiffsplit!<CR>
	nnoremap <leader>gf :diffget //2<CR>
	nnoremap <leader>gj :diffget //3<CR>


" }}}
" Hlslens {{{
	noremap <silent> n :execute('normal! ' . v:count1 . 'n')<CR>
				\:lua require('hlslens').start()<CR>
	noremap <silent> N :execute('normal! ' . v:count1 . 'N')<CR>
				\:lua require('hlslens').start()<CR>
	noremap * *:lua require('hlslens').start()<CR>
	noremap # #:lua require('hlslens').start()<CR>
	noremap g* g*:lua require('hlslens').start()<CR>
	noremap g# g#:lua require('hlslens').start()<CR>

" }}}
" Hop {{{
	nnoremap <leader>h  :HopWord<CR>
	nnoremap <leader>H :HopPattern<CR>
	nnoremap <silent> ,f :HopChar1<CR>
	nnoremap <silent> ,F :HopChar2<CR>
lua <<EOF
  vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')

  -- Highlight used for the first key in a sequence.
  vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')

  -- Highlight used for the second and remaining keys in a sequence.
  vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

  -- Highlight used for the unmatched part of the buffer.
  vim.api.nvim_command('highlight default HopUnmatched guifg=#666666 ctermfg=242')
EOF
"}}}
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
		cnoremap <buffer> w w <bar> !pton % %:r.ipynb
		cnoremap <buffer> wq wq <bar> !pton % %:r.ipynb
		cnoremap <buffer> wqa wqa
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
" Nvim-lsp {{{
	lua << EOF
require('lspsaga').init_lsp_saga({
	finder_action_keys = {
		quit = {'<esc>','q',},
	},
	rename_action_keys = {
		quit = {'<esc>'},
	},
	code_action_keys = {
		quit = {'<esc>','q',},
	},
	max_preview_lines = 50,
})
local custom_attach = function(client)
	print('LSP Started')
	require'lsp_signature'.on_attach()
	require'compe'.setup{
		enabled = true;
		autocomplete = true;
		debug = false;
		min_lenth = 1;
		preselect = 'enable';
		throttle_time = 80;
		source_timeout = 2000;
		imcomplete_delay = 400;
		max_abbr_width = 100;
		max_kind_width = 100;
		max_menu_width = 100;
		documentation = true;
		source = {
			path = true;
			buffer = true;
			calc = true;
			spell = true;
			nvim_lsp = true;
			nvim_lua = true;
			omni = false;
			ultisnips = true;
		};
	}
end

require'lspconfig'.clangd.setup{on_attach=custom_attach}
require'lspconfig'.vimls.setup{on_attach=custom_attach}
require'lspconfig'.bashls.setup{on_attach=custom_attach}
require'lspconfig'.pyright.setup{on_attach=custom_attach}
require'lspconfig'.rust_analyzer.setup{on_attach=custom_attach,root_dir = function() return '.' end,}


require'lsp_signature'.on_attach()

-- Get the counts from your curreent workspace:


-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "/home/gqian/git/lua-language-server"
local sumneko_binary = "/home/gqian/git/lua-language-server/bin/Linux/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  on_attach=custom_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path ..  "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
	-- disable virtual text
	virtual_text = false,

	-- show signs
	signs = true,

	-- delay update diagnostics
	update_in_insert = false,
	-- display_diagnostic_autocmds = { "InsertLeave" },

	}
)
EOF
	"Mappings
	nnoremap <silent> ,f :Lspsaga lsp_finder<CR>
	nnoremap <silent> ,a :Lspsaga code_action<CR>
	vnoremap <silent> ,a :Lspsaga range_code_action<CR>
	nnoremap <silent> K :Lspsaga hover_doc<CR>
	nnoremap <silent> ,r :Lspsaga rename<CR>
	nnoremap <silent> ,d :Lspsaga preview_definition<CR>

	augroup NvimLsp
		au!
		autocmd Filetype lspsagafinder setlocal scrolloff=0
		autocmd CursorHold * lua vim.lsp.diagnostic.set_loclist({open_loclist = false,severity_limit="Hint",})
		autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})
		autocmd BufEnter * lua require'compe'.setup{ enabled = true; autocomplete = true; debug = false; min_lenth = 1; preselect = 'enable'; throttle_time = 80; source_timeout = 2000; imcomplete_delay = 400; max_abbr_width = 100; max_kind_width = 100; max_menu_width = 100; documentation = true; source = { path = true; buffer = true; calc = true; nvim_lsp = true; nvim_lua = true; vsnip = false; ultisnips = true; tabnine = true;}; }
	augroup END

" }}}
" Quick_Fix Lists{{{
	let g:qf_write_changes = 0

" }}}
" Snippets {{{
	let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
	let g:UltiSnipsJumpForwardTrigger='<tab>'

"}}}
"  Statusline {{{
lua <<EOF
local function generator()
	local extensions = require("el.extensions")
	local helper = require("el.helper")
	local builtin = require("el.builtin")
end
require('el').setup({})
EOF
" }}}
" Subversive {{{
	nmap s <plug>(SubversiveSubstitute)
	nmap ss <plug>(SubversiveSubstituteLine)
	nmap S <plug>(SubversiveSubstituteToEndOfLine)

" }}}
" Tabline {{{
lua <<EOF
require"buftabline".setup({
	modifier = ":t",
	index_format = "%d: ",
	buffer_id_index = false,
	icons = false,
	icon_colors = false,
})
EOF
hi TabLineSel guibg=#181d24 guifg=#abb2bf
hi TabLineFill guibg=#282c34 guifg=#abb2bf

" }}}
" Tabular {{{
	augroup Tabular
		au!
		au Filetype markdown inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
	augroup END

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
" }}}
" Terminal (Harpoon) {{{
	nnoremap <leader>t :lua require("harpoon.term").gotoTerminal(1)<CR>
	nnoremap <leader>s :lua require("harpoon.term").sendCommand(1, vim.fn.input("Command≻").."\n")<CR>

" }}}
" TODOs {{{
lua require'todo-comments'.setup()

" }}}
"  Tresitter {{{
lua << EOF
local psconfig = require('nvim-treesitter.parsers').get_parser_configs()
psconfig.markdown = {
	install_info = {
		url = "~/git/tree-sitter-markdown",
		files = {"src/parser.c"}
	},
}
require'nvim-treesitter.configs'.setup{
	ensure_installed = "maintained",
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
augroup tsfold
	au!
	au Filetype cpp set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr() | set foldlevel=1
	au Filetype java set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr() | set foldlevel=1
	au Filetype py set foldmethod=expr | set foldexpr=nvim_treesitter#foldexpr() | set foldlevel=1
augroup END
" }}}
" Undo_Tree {{{
	nnoremap <silent> <leader>u :MundoToggle<CR>

" }}}
" Testing {{{

"}}}
" Last {{{

"}}}
