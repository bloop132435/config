local lsp = require "lspconfig"

local on_attach_add = function(existing_opts)
	if existing_opts == nil then
		existing_opts = {}
	end
	existing_opts.on_attach = function()
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, buffer = true })
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, buffer = true })
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, buffer = true })
		vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { noremap = true, buffer = true })
		vim.keymap.set('n', 'gf', vim.lsp.buf.format, { noremap = true, buffer = true })
		vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { noremap = true, buffer = true })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, buffer = true })
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, buffer = true })
		vim.keymap.set('n', '<leader>r', ':LspRestart<CR>', { noremap = true, buffer = true, silent = true })
		vim.keymap.set('n', '<leader>o', ':Telescope aerial<CR>', { noremap = true, buffer = true, silent = true })
		vim.keymap.set('n', '<leader><leader>f', vim.lsp.buf.format, { noremap = true, buffer = true, silent = true })
	end
	return existing_opts
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.clangd.setup(on_attach_add({ capabilities = capabilities }))
lsp.pyright.setup(on_attach_add({ capabilities = capabilities }))
lsp.rust_analyzer.setup(on_attach_add({ capabilities = capabilities }))
lsp.zls.setup(on_attach_add({ capabilities = capabilities }))
lsp.vhdl_ls.setup(on_attach_add({capabilities = capabilities}))
lsp.lua_ls.setup(on_attach_add({
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = {
				library = "${3rd}/luv/library",
				checkThirdParty = true,
			},
		},
	},
}))
lsp.hdl_checker.setup(on_attach_add({capabilities = capabilities}))
