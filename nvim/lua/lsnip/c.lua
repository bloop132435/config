local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local elif_node_rec
elif_node_rec = function()
	return sn(nil, { c(1, {
		i(1),
		sn(nil, fmt([[
			else if({}){{
				{}
			}} {}]],
			{ i(1), i(2), d(3, elif_node_rec, {}) }
		)),
		sn(nil, fmt([[
			else{{
				{}
			}} {}]],
			{ i(1), i(0) }))
	}) })
end

local get_header_name = function(_, parent)
	local fn = parent.snippet.env.TM_FILENAME
	fn = string.gsub(fn, "%.", "_")
	return string.upper(fn)
end

ls.add_snippets('c', {
	s(
		'for',
		fmt([[
			for({};{};{}){{
				{}
			}}
			]],
			{
				i(1, "i = 0"),
				i(2, "i < n"),
				c(3, {
					f(function(args)
						local init = args[1][1]
						local cond = args[2][1]
						local name = string.gsub(vim.split(init, '=')[1], "%s+", "")
						if string.find(cond, name, 1, true) then
							if string.find(cond, ">", 1, true) then
								return name .. "--"
							elseif string.find(cond, "<", 1, true) then
								return name .. "++"
							end
						end
						return ""
					end, { 1, 2 }),
					i(1, "custom")
				}),
				i(0)
			}
		)
	),
	s(
		'ts',
		fmt([[
			typedef struct {}{{
				{}
			}} {}; {}
			]],
			{
				i(1),
				i(2),
				f(function(args)
					return args[1][1] .. "_t"
				end, { 1 }),
				i(0)
			}
		)
	),
	postfix(".if", {
		d(1, function(_, parent)
			local num = tonumber(parent.snippet.env.POSTFIX_MATCH)
			if num == nil then
				return sn(nil, { i(1, "ERROR: Not a Number") })
			end
			if num == 1 then
				return sn(nil, fmt([[
					if({}){{
						{}
					}}{}
					]], { i(1), i(2), i(0) }
				))
			elseif num == 2 then
				return sn(nil, fmt([[
					if({}){{
						{}
					}} else {{
						{}
					}} {}
					]], { i(1), i(2), i(3), i(0) }
				))
			else
				local lines = { 'if({}){{', '	{}', '}} else {{', '	{}', '}}{}' }
				local nodes = { i(1), i(2), i(3), i(0) }
				local cnt = 3
				for _ = 1, num - 2 do
					table.insert(lines, 3, '	{}')
					table.insert(lines, 3, 'else if ({}) {{')
					cnt = cnt + 1
					table.insert(nodes, #nodes, i(cnt))
					cnt = cnt + 1
					table.insert(nodes, #nodes, i(cnt))
				end
				return sn(nil, fmt(table.concat(lines, '\n'), nodes))
			end
		end)
	}),
	s('and', { t '&& ' }),
	s('or', { t '|| ' }),
	s(
		'hg',
		fmt([[
			#ifndef {}
			#define {}

			{}

			#endif
		]], {
			f(get_header_name),
			f(get_header_name),
			i(0)
		})
	),
	s(
		'if',
		fmt([[
			if({}){{
				{}
			}} {}
		]], {
			i(1),
			i(2),
			i(0),
		}
		)
	),
	s(
		'elif',
		fmt([[
			else if({}){{
				{}
			}} {}
		]], {
			i(1),
			i(2),
			i(0),
		}
		)
	),
	s(
		'else',
		fmt([[
			else{{
				{}
			}} {}
		]], {
			i(1),
			i(0)
		}
		)
	),
	s(
		'iff',
		fmt([[
			if({}){{
				{}
			}} {}
		]],
			{
				i(1),
				i(2),
				d(3, elif_node_rec, {}),
			}
		)
	),
	s(
		'f',
		fmt([[
			{}({}){{
				{}
			}}{}
		]],{
			i(1),
			i(2),
			i(3),
			i(0),
		})
	),
})
