local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local tags = {}

function tags.add_snip()
	ls.add_snippets("typescriptreact", {
		s("<>/", fmt(
		[[
			<{} />	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("cln", fmt(
		[[
			className = "{}"	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("<>", fmt(
		[[
			<{}>
				{}
			</{}>	
		]], {i(1), i(0), rep(1)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("div", fmt(
		[[
			<div>
				{}
			</div>	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("p", fmt(
		[[
			<p>
				{}
			</p>	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("small", fmt(
		[[
			<small>
				{}
			</small>	
		]], {i(0)}
		))
	})


	ls.add_snippets("typescriptreact", {
		s("input", fmt(
		[[
			<input />{}
		]], {i(0)}
		))
	})


	ls.add_snippets("typescriptreact", {
		s("form", fmt(
		[[
			<form>
				{}
			</form>	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("click", fmt(
		[[
			onClick = {}	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("submit", fmt(
		[[
			onSubmit = {}	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("mouseover", fmt(
		[[
			onMouseOver = {}	
		]], {i(0)}
		))
	})

	ls.add_snippets("typescriptreact", {
		s("mouseout", fmt(
		[[
			onMouseOut = {}	
		]], {i(0)}
		))
	})
end

return tags
