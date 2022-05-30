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

"}}}
" p-Finders {{{
		Plug 'phaazon/hop.nvim'  "easy motion but for nvim
		Plug 'wincent/loupe' "better incsearch for vim
		Plug 'elihunter173/dirbuf.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'brooth/far.vim'
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'

		"}}}
" p-Git {{{
		Plug 'kdheepak/lazygit.nvim' "lazy git integration for neovim
		Plug 'tpope/vim-fugitive'

"}}}
" p-Misc {{{
		Plug 'machakann/vim-sandwich'  "surround
		Plug 'terrortylor/nvim-comment'
		Plug 'mbbill/undotree'
		Plug 'wellle/targets.vim'  "nicer i and a motions
		Plug 'skywind3000/asyncrun.vim'  "configure things to asyncly run and spit out results
		Plug 'dstein64/vim-startuptime' "Startuptime logging
		Plug 'steelsojka/pears.nvim'
		Plug 'simeji/winresizer'
		Plug 'bfredl/nvim-ipy'
		" Plug 'rhysd/clever-f.vim'
		Plug 'gukz/ftFt.nvim'
		Plug 'nikvdp/neomux'

"}}}
" p-Testing {{{
	Plug 'lukas-reineke/indent-blankline.nvim'

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
		autocmd filetype vim setlocal foldmethod=marker
		au Filetype tmux setlocal foldmethod=marker
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

	function! MyFoldText()
		let line = getline(v:foldstart)
		let foldedlinecount = v:foldend - v:foldstart + 1
		return ' 祈 '. foldedlinecount . line
	endfunction
	set foldtext=MyFoldText()
	set fillchars=fold:\-

" }}}
" Vanilla_Vim_Mappings {{{
	nnoremap B ^
	nnoremap E $
	nnoremap U <C-r>
	nnoremap <esc> :noh<CR>
	nnoremap <leader><leader>a GVgg
	nmap <BS> za
	nmap <leader><leader>s :so $MYVIMRC<CR>
	nnoremap Y y$
	nnoremap <leader>bd :bd! %<CR>
	nnoremap <leader><leader>a GVgg
	let g:rnu = v:true
	function! ToggleLine() abort
		if g:rnu == v:true
			let g:rnu = v:false
			set norelativenumber
		else
			let g:rnu = v:true
			set relativenumber
		endif
	endfunction
	nnoremap <silent> <leader>l :call ToggleLine()<CR>
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
	nnoremap ;w       <C-w>w
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
	tnoremap <C-CR> <C-\><C-n>
	" TODO, make this work for other end deliminters ],},",'
	inoremap  <C-[>f)a

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
require"pears".setup()
EOF
" }}}
" COC {{{
	nmap ,r <Plug>(coc-rename)
	nnoremap <silent> ,o :CocFzfList outline <CR>
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gr <Plug>(coc-references)
	nmap <silent> ,f <Plug>(coc-references)
	nnoremap <silent> ,a :CocFzfList actions<CR>
	nnoremap <silent> ,y :CocFzfList yank<CR>
	nnoremap <silent> ,d  :CocFzfList diagnostics --current-buf<CR>
	nnoremap <silent> ,k  :CocFzfList diagnostics <CR>
	inoremap <silent> <C-s> :call CocActionAsync('showSignatureHelp')<CR>
	nnoremap <silent> <C-s> :call CocActionAsync('showSignatureHelp')<CR>
	inoremap <silent><expr> <c-space> coc#refresh()
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	function! s:show_documentation()
	  if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	  else
		call feedkeys('K', 'in')
	  endif
	endfunction
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
	let g:coc_global_extensions = ['coc-word','coc-ultisnips-select','coc-ultisnips','coc-marketplace','coc-vimlsp','coc-pyright','coc-json','coc-clangd','coc-yank','coc-java','coc-fzf-preview']
	let g:python3_host_prog = '/usr/bin/python3'

" }}}
" Color Schemes {{{
	colo dracula
	set background=dark
	hi OverRuler  guibg=#cc241d
	call matchadd('OverRuler', '\v^.{200}\zs.*$', 100)
	hi Normal guibg=NONE ctermbg=NONE
	hi Folded guibg=NONE guifg=#80a0ff
	hi WinSeparator guibg=NONE ctermbg=NONE

" }}}
" Comment {{{
	lua require('nvim_comment').setup()
" }}}
" Finders {{{
	let g:loaded_netrwPlugin = 1
	nnoremap <silent> <C-n> :Dirbuf<CR>
	nnoremap <silent> <C-_> :Dirbuf %<CR>


lua <<EOF
require('dirbuf').setup({sort_order= "directories_first"})
EOF
	command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>
	let $FZF_DEFAULT_COMMAND="fd -E .git/ -H -L  --strip-cwd-prefix""
	nnoremap <silent> <C-p> :call fzf#vim#files('.',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <C-f> :call fzf#vim#buffer_lines({'options':'--no-preview'})<CR>
	nnoremap <silent> <C-b> :Buffers<CR>
	nnoremap <silent> <C-h> :Helptags<CR>


	nnoremap <silent> <leader>fp :call fzf#vim#files('.',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fl :call fzf#vim#buffer_lines({'options':'--no-preview'})<CR>
	nnoremap <silent> <leader>fb :Buffers<CR>
	nnoremap <silent> <leader>fc :call fzf#vim#files('~/OneDrive/Programs',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fd :call fzf#vim#files('~/.config',{'options':'--preview "~/.config/nvim/preview.sh {}"'})<CR>
	nnoremap <silent> <leader>fh :Helptags<CR>


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

" lua require('eline')
lua << EOF
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF
highlight IndentBlanklineContextChar guifg=#bd93f9



"}}}
