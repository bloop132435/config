function InGitRepo()
	local git_dir = vim.fn.finddir('.git', vim.fn.getcwd() .. ";")
	return (git_dir ~= "")
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('sets')
require('maps')
require('auto')
