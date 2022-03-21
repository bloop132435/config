" Plugins{{{
"be sure to install Vim Plug
call plug#begin('~/.vim/plugged')
" p-lua {{{
		Plug 'nvim-lua/popup.nvim'
		Plug 'nvim-lua/plenary.nvim'

"}}}
" p-Language_Support {{{
		Plug 'bloop132435/ultisnips'
		Plug 'neoclide/coc.nvim'

" }}}
" p-Looks {{{
		Plug 'bloop132435/dracula.nvim', {'branch':'main'}
		Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'} "Tree sitter
		Plug 'akinsho/nvim-bufferline.lua'
		Plug 'folke/zen-mode.nvim'

"}}}
" p-Finders {{{
		Plug 'phaazon/hop.nvim'  "easy motion but for nvim
		Plug 'wincent/loupe' "better incsearch for vim
		Plug 'elihunter173/dirbuf.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
		Plug 'brooth/far.vim'

		"}}}
" p-Git {{{
		Plug 'kdheepak/lazygit.nvim' "lazy git integration for neovim
		Plug 'tpope/vim-fugitive'

"}}}
" p-Misc {{{
		Plug 'machakann/vim-sandwich'  "surround
		Plug 'xiyaowong/nvim-cursorword'
		Plug 'b3nj5m1n/kommentary'  "comments
		Plug 'mbbill/undotree'
		Plug 'wellle/targets.vim'  "nicer i and a motions
		Plug 'skywind3000/asyncrun.vim'  "configure things to asyncly run and spit out results
		Plug 'dstein64/vim-startuptime' "Startuptime logging
		Plug 'steelsojka/pears.nvim'
		Plug 'simeji/winresizer'
		Plug 'bfredl/nvim-ipy'
		Plug 'rhysd/clever-f.vim'

"}}}
" p-Testing {{{
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
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
	set clipboard=unnamedplus
	set mouse=a " enable mouse
	set encoding=utf8
	set laststatus=2 " always show status line
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
	nnoremap <silent> <C-t> :term bash --rcfile ~/.config/vim-term.sh<CR>
	nnoremap <silent> <leader>t :term bash --rcfile ~/.config/vim-term.sh<CR>
	nnoremap <C-g> g<C-g>

	inoremap  <C-W>
	tnoremap  <C-\><C-n>

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
		autocmd filetype java nnoremap <F4> :w<CR> :AsyncRun     -mode=term -cols=80 -pos=right -save=1 -focus=1 -silent time javac %:t:r.java<CR>
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
" Clever-f {{{
	let g:clever_f_mark_direct=1

" }}}
" COC {{{
	nmap ,r <Plug>(coc-rename)
	let g:coc_global_extensions = ['coc-word','coc-ultisnips-select','coc-ultisnips','coc-tabnine','coc-marketplace','coc-vimlsp','coc-pyright','coc-json','coc-clangd']
	let g:python3_host_prog = '/usr/bin/python3'

" }}}
" Color Schemes {{{
	colo dracula
	set background=dark
	hi OverRuler  guibg=#cc241d
	call matchadd('OverRuler', '\v^.{200}\zs.*$', 100)

" }}}
" Debugging {{{
	packadd termdebug
	let g:termdebug_wide = 163
	nnoremap [e :Evaluate<space>
	nnoremap [r :Run <CR>
	nnoremap [a :Arguments <CR>
	nnoremap [b :Break<CR>
	nnoremap [B :call GDBBreakpoint()<CR>
	nnoremap [<space> :call TermDebugSendCommand(input("Command to send"))<CR>
	nnoremap [s :Step<CR>
	nnoremap [n :Over<CR>
	nnoremap [f :Finish<CR>
	nnoremap [c :Continue<CR>
	nnoremap [q :Stop<CR>
	hi debugPC term=reverse ctermbg=darkblue guibg=darkblue
	hi debugBreakpoint term=reverse ctermbg=red guibg=red

" }}}
" Finders {{{
	let g:loaded_netrwPlugin = 1
	nnoremap <silent> <C-n> :Dirbuf<CR>


lua <<EOF
require('dirbuf').setup({sort_order= "directories_first"})
require('telescope').setup{
defaults = {
	vimgrep_arguments = {
		'rg',
		'--color=never',
		'--no-heading',
		'--with-filename',
		'--line-number',
		'--column',
		'--smart-case'
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		previewer = false,
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_ignore_patterns = {".git","__pycache__"},
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = false,
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
require('telescope').load_extension('fzf')
EOF
	nnoremap <silent> <C-p> :Telescope find_files theme=get_ivy hidden=true<CR>
	nnoremap <silent> <C-f> :Telescope current_buffer_fuzzy_find theme=get_ivy<CR>
	nnoremap <silent> <C-b> :Telescope buffers theme=get_ivy <CR>
	nnoremap <silent> <C-l> :Telescope loclist theme=get_ivy<CR>
	nnoremap <silent> <C-q> :Telescope quickfix theme=get_ivy<CR>
	nnoremap <silent> <C-q> :Telescope quickfix theme=get_ivy<CR>
	nnoremap <silent> <C-h> :Telescope help_tags theme=get_ivy<CR>

	nnoremap <silent> <leader>fp :Telescope find_files theme=get_ivy hidden=true<CR>
	nnoremap <silent> <leader>fl :Telescope current_buffer_fuzzy_find theme=get_ivy <CR>
	nnoremap <silent> <leader>fb :Telescope buffers theme=get_ivy<CR>
	nnoremap <silent> <leader>fq :Telescope quickfix theme=get_ivy<CR>
	nnoremap <silent> <leader>fc :Telescope find_files theme=get_ivy hidden=true cwd=~/programs/lib<CR>
	nnoremap <silent> <leader>fd :Telescope find_files theme=get_ivy hidden=true cwd=~/.config<CR>
	nnoremap <silent> <leader>fh :Telescope help_tags theme=get_ivy<CR>
	nnoremap <silent> <leader>fr :lua require'spectre'.open()<CR>

" }}}
" Formatting {{{
	" augroup fmt
	"   autocmd!
	"   autocmd BufWritePre * undojoin | Neoformat
	" augroup END



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
	nnoremap <silent> ,f :HopChar1<CR>
	nnoremap <silent> ,F :HopChar2<CR>
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
" Q-sharp {{{
	augroup qsharp
		au!
		au BufEnter *.qs set ft=cs
	augroup END

" }}}
" Snippets {{{
	let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger='<c-k>'
	let g:UltiSnipsJumpForwardTrigger='<c-j>'

"}}}
" Spotify {{{
	nnoremap <silent> <leader>s<space> :Spotify play/pause<CR>
	nnoremap <silent> <leader>sn :Spotify next<CR>
	nnoremap <silent> <leader>sp :Spotify prev<CR>

" }}}
"  Statusline {{{
	let &statusline='%#Normal# '
	set laststatus=0

" }}}
"  Tresitter {{{
lua << EOF
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

" }}}
" Tabline {{{
	lua <<EOF
	require('bufferline').setup {
	  options = {
		numbers = function(opts)
		return string.format('%s.', opts.ordinal )
		end,
		mappings = true,

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

nnoremap <leader>p :Files<CR>
let g:fzf_layout = {'window':{'width':0.9, 'height':0.9}}
if exists('$TMUX')
	let g:fzf_layout = {'tmux': '-p90%,90%'}
endif

"}}}
