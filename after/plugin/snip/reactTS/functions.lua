local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local functions = {}

function functions.add_snip()

	ls.add_snippets("typescriptreact", {
		s("fun", fmt(
		[[
			function {}:React.FC<{}>() {{

				return (
					
				)

			}}
		]], {i(0), i(1)}
		))
	})	

	ls.add_snippets("typescriptreact", {
		s("effect", fmt(
		[[
			useEffect((){{
				{}	
			}}, [])	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("state", fmt(
		[[
			const [] = useState({})	
		]], {i(0)}
		))
	})

end

return functions
