local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local functions = {}

function functions.add_snip()
	ls.add_snippets("cpp", {
		s("newWindowh", fmt(
		[[
			#ifndef MAINWINDOW_H
			#define MAINWINDOW_H

			#include <QMainWindow>

			namespace Ui {{
				class {};
			}}

			class {}: public QMainWindow {{
				Q_OBJECT

			public:
				explicit {}(QWidget *parent = nullptr);
				~{}();

			private:
				Ui::{} *ui;
			}};

			#endif // MAINWINDOW_H
		]], {i(1, "MainWindow"), rep(1), rep(1), rep(1), rep(1)}
		))
	})
end

return functions
