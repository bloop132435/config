return {
	{
		'monaqa/dial.nvim',
		config = function()
			vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
			vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
			vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal(), {noremap = true})
			vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal(), {noremap = true})
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
			vim.keymap.set("v", "g<C-a>",require("dial.map").inc_gvisual(), {noremap = true})
			vim.keymap.set("v", "g<C-x>",require("dial.map").dec_gvisual(), {noremap = true})
		end
	}
}
