return {
	{
		'neovim/nvim-lspconfig',
	},
	{
		"williamboman/mason.nvim",
		init = function()
			require("mason").setup()
		end,
		build = ":MasonUpdate",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		init = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})
		end
	},
	{
		'ms-jpq/coq_nvim'
	},
}
