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
		Plug 'bloop132435/dracula.nvim', {'branch':'main'}
		Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'} "Tree sitter
		Plug 'jose-elias-alvarez/buftabline.nvim'
		Plug 'rktjmp/git-info.vim'


"}}}
" p-Finders {{{
		Plug 'phaazon/hop.nvim'  "easy motion but for nvim
		Plug 'wincent/loupe' "better incsearch for vim
		Plug 'windwp/nvim-spectre'
		Plug 'Shougo/defx.nvim'
		Plug 'kristijanhusak/defx-git'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

		"}}}
" p-Git {{{
		Plug 'kdheepak/lazygit.nvim' "lazy git integration for neovim
		Plug 'tpope/vim-fugitive'

"}}}
" p-Misc {{{
		Plug 'machakann/vim-sandwich'  "surround
		Plug 'b3nj5m1n/kommentary'  "comments
		Plug 'mbbill/undotree'
		Plug 'szw/vim-maximizer'  "mazimize a window
		Plug 'wellle/targets.vim'  "nicer i and a motions
		Plug 'skywind3000/asyncrun.vim'  "configure things to asyncly run and spit out results
		Plug 'dstein64/vim-startuptime' "Startuptime logging
		Plug 'tversteeg/registers.nvim'
		Plug 'windwp/nvim-autopairs'
		Plug 'simeji/winresizer'
		Plug 'bfredl/nvim-ipy'
		Plug 'rhysd/clever-f.vim'

"}}}
" p-Latex {{{
		Plug 'xuhdev/vim-latex-live-preview', {'for':'latex'}

" }}}
" p-Testing {{{
Plug 'jbyuki/venn.nvim'
Plug 'nikvdp/neomux'

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
	augroup pythonCell
		au!
		autocmd FileType python iabbrev <buffer> cell ##o##O
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
		autocmd BufWinEnter COMMIT_EDITMSG set nobuflisted
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
	nmap <leader><leader>s :so $MYVIMRC<CR>
	nnoremap Y y$
	nnoremap <leader>bd :bd! %<CR>
	nnoremap <leader><leader>a GVgg
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
" BufTabLine {{{
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
" Cheat.sh {{{
	let g:CheatSheetDoNotMap = 1

" }}}
" Color Schemes {{{
	colo dracula
	set background=dark
	highlight ActiveNormal guibg=#181a26
	highlight InactiveNormal guibg=#282a36
	augroup focus
		au!
		au WinEnter * setlocal winhighlight=Normal:ActiveNormal
		au WinLeave * setlocal winhighlight=Normal:InactiveNormal
	augroup END
	hi OverRuler  guibg=#cc241d
	call matchadd('OverRuler', '\v^.{200}\zs.*$', 100)

" }}}
" Clever-f {{{
	let g:clever_f_mark_direct=1

" }}}
" Debugging {{{
	packadd termdebug
	let g:termdebug_wide = 163
	nnoremap [e :Evaluate
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
	nnoremap <silent>  :Defx .  -show-ignored-files<CR>

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

	function! Open_defx_if_directory()
		" This throws an error if the buffer name contains unusual characters like
		" [[buffergator]]. Desired behavior in those scenarios is to consider the
		" buffer not to be a directory.
		try
			let l:full_path = expand(expand('%:p'))
		catch
			return
		endtry

		" If the path is a directory, delete the (useless) buffer and open defx for
		" that directory instead.
		if isdirectory(l:full_path)
			execute "Defx `expand('%:p')` -show-ignored-files | bd " . expand('%:r')
		endif
	endfunction
	augroup Defx
		au!
		autocmd Filetype defx call DefxSettings()
		autocmd BufEnter * call Open_defx_if_directory()
	augroup END

lua <<EOF
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
		prompt_position = "bottom",
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		previewer = false,
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {".git","__pycache__"},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		shorten_path = true,
		winblend = 0,
		width = 0.75,
		preview_cutoff = 120,
		results_height = 1,
		results_width = 0.8,
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
	nnoremap <silent> <C-p> :Telescope find_files  hidden=true<CR>
	nnoremap <silent> <C-f> :Telescope current_buffer_fuzzy_find <CR>
	nnoremap <silent> <C-b> :Telescope buffers  <CR>
	nnoremap <silent> <C-r> :lua require'spectre'.open()
	nnoremap <silent> <C-l> :Telescope loclist<CR>
	nnoremap <silent> <C-q> :Telescope quickfix <CR>
	nnoremap <silent> <C-h> :Telescope help_tags <CR>

	nnoremap <silent> <leader>fp :Telescope find_files  hidden=true<CR>
	nnoremap <silent> <leader>fl :Telescope current_buffer_fuzzy_find  <CR>
	nnoremap <silent> <leader>ff :Telescope live_grep  <CR>
	nnoremap <silent> <leader>fb :Telescope buffers <CR>
	nnoremap <silent> <leader>fq :Telescope quickfix <CR>
	nnoremap <silent> <leader>fc :Telescope find_files  hidden=true cwd=~/programs/lib<CR>
	nnoremap <silent> <leader>fd :Telescope find_files  hidden=true cwd=~/.config<CR>
	nnoremap <silent> <leader>fh :Telescope help_tags <CR>
	nnoremap <silent> <leader>fr :lua require'spectre'.open()

" }}}
" Formatting {{{
	function! Format(formatter) abort
		let s:l = line('.')
		exe "%!" . a:formatter . " %"
		exe s:l
	endfunction
	augroup Formatting
		au!
		au BufWinEnter *.clang-format set ft=yaml
		au BufWritePost *.cpp call Format("clang-format")
		au BufWritePost *.py  call Format("yapf")
	augroup END

" }}}
" Git {{{
	let $GIT_EDITOR = "nvr -cc split --remote-wait "
	nmap <silent> <leader>gg :LazyGit<CR>
	nnoremap <silent> <leader>gd :Gdiffsplit!<CR>
	nnoremap <silent> <leader>gf :diffget //2<CR>
	nnoremap <silent> <leader>gj :diffget //3<CR>


" }}}
" Hop {{{
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
	let g:markdown_fenced_languages =	['html', 'python', 'ruby', 'vim', 'cpp', 'java']
	function! Dedent() abort
		let l = line('.')
		let tail = matchstr(getline(l),"^.\\zs.*$")
		call setline(l,tail)
	endfunction
	inoremap  :call Dedent()<CR>
	augroup markdown
		au!
        autocmd Filetype markdown setlocal comments=n:*,n:-\ [\ ],n:-
        autocmd Filetype markdown setlocal formatoptions=ctnqro
	augroup END

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
	require'lsp_signature'.on_attach({
		fix_pos = true,
		extra_trigger_chars = {'(',',',' '},
	})
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

require'lspconfig'.clangd.setup{on_attach=custom_attach, cmd = {"clangd","--background-index","-header-insertion=never"},}
require'lspconfig'.vimls.setup{on_attach=custom_attach}
require'lspconfig'.bashls.setup{on_attach=custom_attach}
require'lspconfig'.pyright.setup{on_attach=custom_attach}
require'lspconfig'.rust_analyzer.setup{on_attach=custom_attach,root_dir = function() return '.' end,}

require'lspconfig'.texlab.setup{
		on_attach = custom_attach,
	 cmd = { "texlab" },
    filetypes = { "tex", "bib" },
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          isContinuous = false
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {}
        }
      }
    }
}

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
	virtual_text = true,

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
	nnoremap <silent> gh :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
	augroup NvimLsp
		au!
		autocmd Filetype lspsagafinder setlocal scrolloff=0
		autocmd CursorHold * lua vim.lsp.diagnostic.set_loclist({open_loclist = false,})
		autocmd BufEnter * lua require'compe'.setup{ enabled = true; autocomplete = true; debug = false; min_lenth = 1; preselect = 'enable'; throttle_time = 80; source_timeout = 2000; imcomplete_delay = 400; max_abbr_width = 100; max_kind_width = 100; max_menu_width = 100; documentation = true; source = { path = true; buffer = true; calc = true; nvim_lsp = true; nvim_lua = true; vsnip = false; ultisnips = true; tabnine = true;}; }

	augroup END

" }}}
" Snippets {{{
	let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.config/nvim/UltiSnips"
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger='<c-k>'
	let g:UltiSnipsJumpForwardTrigger='<c-j>'

"}}}
"  Statusline {{{
	set statusline=
	" LEFT
		" Mode
		let g:modeToText = {
					\ "n" : "NORMAL",
					\ "i" : "INSERT",
					\ "v" : "VISUAL",
					\ "V" : "V-LINE",
					\ "\<C-v>" : "VBLOCK",
					\ "R" : "RPLACE" ,
					\ "c" : "COMMND",
					\ "t" : "TERMNL",
					\ "s" : "SELECT",
					\}
		set statusline+=[%{g:modeToText[mode()]}]
		" show full file path
		set statusline+=[%F]
		set statusline+=
		" Git Branch
		set statusline+=[%{git_info#branch_name()}]
		" Modified and Read-only
		set statusline+=%m
	"RIGHT
		set statusline+=%=
		" Read-only
		set statusline+=%r
		" Git status
		set statusline+=[%{git_info#changes()['as_string']}]
		" Filetype
		set statusline+=%y
		" show current line number out of total lines
		set statusline+=[%p%%]
		set statusline+=:[%l/%L]
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
" Undo_Tree {{{
	nnoremap <silent> <leader>u :UndotreeToggle<CR>

" }}}
" Testing {{{
nnoremap <silent> <C-t> :Neomux<CR>
nnoremap <silent> <leader>t :Neomux<CR>
tnoremap nvim ivw<space>"=WindowNumber()<CR>pA<space>

"}}}
