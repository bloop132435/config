return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-calc',
			'lukas-reineke/cmp-rg',
			'hrsh7th/cmp-nvim-lua',
			'ray-x/cmp-treesitter',
		},
		config = function()
			vim.cmd([[imap <silent><expr> <C-J> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-J>']])
			vim.cmd([[inoremap <silent> <C-K> <CMD>lua require'luasnip'.jump(-1)<CR>]])
			vim.cmd([[snoremap <silent> <C-J> <CMD>lua require('luasnip').jump(1)<CR>]])
			vim.cmd([[snoremap <silent> <C-K> <CMD>lua require('luasnip').jump(-1)<CR>]])
			vim.cmd([[imap <silent><expr> <C-L> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-L>']])
			vim.cmd([[smap <silent><expr> <C-L> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-L>']])
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
					{ name = 'buffer' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'calc' },
					{ name = "rg" },
					{ name = 'nvim_lua' },
					{ name = 'treesitter' },
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline' },
				})
			})

		end,
	},
}
