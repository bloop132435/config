local coroutine = require'coroutine'
local M = {}

local fd = function()
	local file = io.popen("fd","r")
	local flist = {}
	local str = file:read("*a")
	for i in string.gmatch(str,"[^\n]+") do
		table.insert(flist,i)
	end
	print(vim.inspect(flist))
end

M.fd = fd

return M
