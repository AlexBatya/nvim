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
		s("wf_newMenu", fmt(
		[[
    var menuStrip = new MenuStrip {{
      Dock = DockStyle.Top
    }};

    var fileMenu = new ToolStripMenuItem("Файл");
    var exitMenuItem = new ToolStripMenuItem("Выход", null, _mainController.ExitApp){{
      ShortcutKeys = Keys.Control | Keys.W
    }};

    fileMenu.DropDownItems.AddRange(new ToolStripItem[] {{
      exitMenuItem,
    }});

    menuStrip.Items.AddRange(new ToolStripItem[]{{
      fileMenu,
    }});
		]], {}
		))
	})

end

return functions
