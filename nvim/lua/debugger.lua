local dap = require'dap'
local M = {}
local last_gdb_config
M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
	if args and #args > 0 then
		last_gdb_config = {
			type = "cpp",
			name = args[1],
			request = "launch",
			program = table.remove(args,1),
			args = args,
			cwd = vim.fn.getcwd(),
			env = {},
			externalConsole = true,
			MIMode = mi_mode or "gdb",
		}
	end

	if not last_gdb_config then
		print('No binary to debug')
		return
	end

	dap.run(last_gdb_config)
	dap.repl.open()
end
return M
