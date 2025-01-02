local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local functions = {}

function functions.add_snip()

	ls.add_snippets("cs", {
		s("wf_name", fmt(
		[[
    using System;
    using System.Windows.Forms;

    namespace MyApp.{} {{
      {}
    }}
		]], {i(1), i(0)}
		))
	})

  ls.add_snippets("cs", {
		s("wf_class", fmt(
		[[
    public class {}: {} {{

    }}
		]], {i(1), i(0)}
		))
	})

  ls.add_snippets("cs", {
		s("wf_field", fmt(
		[[
    private readonly {}? _{}; 
		]], {i(1), i(0)}
		))
	})

  ls.add_snippets("cs", {
		s("wf_object", fmt(
		[[
    _{} = new {}(); 
		]], {i(1), i(0)}
		))
	})

  ls.add_snippets("cs", {
		s("wf_add", fmt(
		[[
    {}.Controls.Add({});
		]], {i(1), i(0)}
		))
	})

end


return functions
