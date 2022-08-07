local function remove_duplicate_lines()
	-- print(vim.inspect(vim.fn.getbufline("%", 1, "$")))
	local line_table = {}
	local prev_line = "asdfasdfasdfasdfasdf;klj;lkjzxvc/.,zmxcv;/,mzxvc/.m"
	for key, value in pairs(vim.fn.getbufline("%", 1, "$")) do
		-- asdf
		if value ~= prev_line then
			table.insert(line_table, value)
			prev_line = value
		end
	end
	-- print(vim.inspect(line_table))
	vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(), 0, -1, false, line_table)
end

local function tableize()
	local overall_table = {}
	for _, l in pairs(vim.fn.getbufline("%", 1, "$")) do
		if string.len(l) == 0 then
			goto continue
		end
		local column_name = l:match("%S+")
		local remainder = l:sub(#column_name + 2)
		local in_overall_table = false
		for k, _ in pairs(overall_table) do
			if k == column_name then
				in_overall_table = true
			end
		end
		if not in_overall_table then
			print(column_name)
			overall_table[column_name] = { remainder }
		else
			table.insert(overall_table[column_name], remainder)
		end
		::continue::
	end
	print(vim.inspect(overall_table))
	-- TODO: for each column name, ask user if they want to keep it or not.
	local refined_table = {}
	for name, tbl in pairs(overall_table) do
		local ans = vim.fn.input("Keep " .. name .. "? (y/n)")
		if string.sub(ans, 1, 2) == "y" or string.sub(ans, 1, 2) == "Y" then
			refined_table[name] = tbl
		end
	end
	overall_table = refined_table
	-- TODO: for each column name, allow user to modify how far the column name extends
	for name, tbl in pairs(overall_table) do
		local common = ""
		common = name .. tbl[1]
		for _, entry in pairs(tbl) do
			local full_entry = name .. entry
			for i = 0, math.min(#full_entry, #common) do
				if string.sub(full_entry, i, i + 1) ~= string.sub(common, i, i + 1) or string.sub(full_entry, i, i + 1) == ':' then
					common = string.sub(full_entry, 0, i)
					break
				end
			end
		end
		print(common)
	end
	-- TODO: for each column name, allow user to modify the display name of the column
	print(vim.inspect(overall_table))
end

return {
	remove_duplicate_lines = remove_duplicate_lines,
	tableize = tableize,
}
