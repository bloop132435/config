local lsp = require "lspconfig"
local coq = require "coq" 

local on_attach_add = function(existing_opts)
	if existing_opts == nil then
		existing_opts = {}
	end
	existing_opts.on_attach =  function()
		vim.keymap.set('n','gd',vim.lsp.buf.definition,{noremap = true,buffer = true})
		vim.keymap.set('n','gr',vim.lsp.buf.references,{noremap = true,buffer = true})
		vim.keymap.set('n','gD',vim.lsp.buf.declaration,{noremap = true,buffer = true})
		vim.keymap.set('n','<F2>',vim.lsp.buf.rename,{noremap = true,buffer = true})
		vim.keymap.set('n','gf',vim.lsp.buf.format,{noremap = true,buffer = true})
		vim.keymap.set('n','ga',vim.lsp.buf.code_action,{noremap = true,buffer = true})
		vim.keymap.set('n','K',vim.lsp.buf.hover,{noremap = true,buffer = true})
	end
	return existing_opts
end
lsp.clangd.setup(coq.lsp_ensure_capabilities(on_attach_add())) 
lsp.pyright.setup(coq.lsp_ensure_capabilities(on_attach_add())) 
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities(on_attach_add())) 
--lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
--	settings = {
--		Lua = {
--			runtime = {
--				version = 'LuaJIT',
--			},
--			diagnostics = {
--				globals = {'vim'},
--			},
--			workspace = {
--				library = vim.api.nvim_get_runtime_file("", true),
--			},
--			telemetry = {
--				enable = false,
--			},
--		},
--	},
--}))
require("my-lsp.coq_setup")
