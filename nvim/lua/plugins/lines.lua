local function get_diagnostic_label(props)
	local icons = { error = '', warn = '', info = '', hint = '', }
	local label = {}

	for severity, icon in pairs(icons) do
		local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
		if n > 0 then
			table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
		end
	end
	if #label > 0 then
		table.insert(label, {'| '})
	end
	return label
end
local function get_git_diff(props)
	local icons = { removed = "", changed = "", added = "" }
	local labels = {}
	local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
	-- local signs = vim.b.gitsigns_status_dict
	for name, icon in pairs(icons) do
		if tonumber(signs[name]) and signs[name] > 0 then
			table.insert(labels, { icon .. " " .. signs[name] .. " ",
			group = "Diff" .. name
		})
	end
end
if #labels > 0 then
	table.insert(labels, { '| ' })
end
return labels
end

return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		init = function()
			require("bufferline").setup{
				options = {
					themable = true,
					diagnostics = 'nvim_lsp',
				},
			}
		end,
		config = function()
			vim.keymap.set('n','<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>',{noremap = true, silent = true})
			vim.keymap.set('n','<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>',{noremap = true, silent = true})
		end
	},
	{
		'b0o/incline.nvim',
		init = function()
			require('incline').setup {
				render = function(props)

					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

					local buffer = {
						{ get_diagnostic_label(props) },
						{ get_git_diff(props) },
						{ ft_icon, guifg = ft_color }, { " " },
						{ filename, gui = modified },
					}
					return buffer
				end
			}
		end
	},
	{
		'Bekaboo/dropbar.nvim',
		config = function()
			require('dropbar').setup()
			vim.keymap.set('n','<leader>b', require('dropbar.api').pick)
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		config = nil,
	}
}
