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
    -- Сниппет для создания TableLayoutPanel
    s("wf_tablelayout", fmt(
      [[
      TableLayoutPanel {} = new TableLayoutPanel {{
        RowCount = {},
        ColumnCount = {},
        Dock = DockStyle.{},
      }};

      // Настройка столбцов
      {}.ColumnStyles.Add(new ColumnStyle(SizeType.{}, {}));
      {}.ColumnStyles.Add(new ColumnStyle(SizeType.{}, {}));

      // Настройка строк
      {}.RowStyles.Add(new RowStyle(SizeType.{}, {}));
      {}.RowStyles.Add(new RowStyle(SizeType.{}, {}));

      // Добавление элементов в ячейки
      {}.Controls.Add({}, {}, {});
      {}.Controls.Add({}, {}, {});
      ]],
      {
        i(1, "tableLayoutPanel"),  -- Имя TableLayoutPanel
        i(2, "3"),                -- Количество строк
        i(3, "3"),                -- Количество столбцов
        i(4, "Fill"),             -- DockStyle

        rep(1), i(5, "Percent"), i(6, "50"),  -- Столбец 1
        rep(1), i(7, "Percent"), i(8, "50"),  -- Столбец 2

        rep(1), i(9, "Absolute"), i(10, "50"), -- Строка 1
        rep(1), i(11, "Percent"), i(12, "50"), -- Строка 2

        rep(1), i(13, "control1"), i(14, "0"), i(15, "0"), -- Элемент в ячейку (0,0)
        rep(1), i(16, "control2"), i(17, "1"), i(18, "1"), -- Элемент в ячейку (1,1)
      }
    ))
  })

end

return functions
