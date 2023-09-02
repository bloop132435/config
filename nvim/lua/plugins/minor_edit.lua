return {
	{
		'monaqa/dial.nvim',
		config = function()
			vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
			vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
			vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), { noremap = true })
			vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), { noremap = true })
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
			vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
			vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			require('nvim-autopairs').setup()
		end
	},
	{
		'abecodes/tabout.nvim',
		config = function()
			require('tabout').setup {
				tabkey = '<C-L>', -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = '', -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = false, -- shift content if tab out is not possible
				enable_backwards = false, -- well ...
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = '`', close = '`' },
					{ open = '(', close = ')' },
					{ open = '[', close = ']' },
					{ open = '{', close = '}' }
				},
			}
		end,
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({})
		end
	},
	{
		'machakann/vim-sandwich'
	},
	{
		'cappyzawa/trim.nvim',
		config = function()
			require('trim').setup()
		end
	},
	{
		'tpope/vim-endwise',
	},
	{
		'zdcthomas/yop.nvim',
		config = function()
			--[[ require('yop').op_map({ 'n', 'v' }, '<leader>a', function(lines, info)
				if #lines == 1 then
					return lines
				end
				local contains_eq = true
				local contains_comma = true
				local contains_define = true
				local contains_parens = true
				local contains_braces = true
				local contains_brackets = true
				for _, l in pairs(lines) do
					if string.find(l, "=") == nil then
						contains_eq = false
					end
					if string.find(l, ",") == nil then
						contains_comma = false
					end
					if string.find(l, "#define") == nil then
						contains_define = false
					end
					if string.find(l, "%(") == nil or string.find(l, "%)") == nil then
						contains_parens = false
					end
					if string.find(l, "{") == nil or string.find(l, "}") == nil then
						contains_braces = false
					end
					if string.find(l, "%[") == nil or string.find(l, "%]") == nil then
						contains_braces = false
					end
				end
				print(vim.inspect({ ["contains_eq"] = contains_eq, ["contains_comma"] = contains_comma,
					["contains_define"] = contains_define, ["contains_parens"] = contains_parens,
					["contains_braces"] = contains_braces, ["contains_brackets"] = contains_brackets, }))
			end) ]]
		end
	},
}
