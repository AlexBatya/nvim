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
		s("main", fmt(
		[[
			#include "{}.h"

			#include <QApplication>

			int main(int argc, char *argv[])
			{{
				QApplication a(argc, argv);
				{} w;
				w.show();
				return a.exec();
			}}
		]], {i(1), i(0)}
		))
	})

	ls.add_snippets("cpp", {
		s("newWindowcpp", fmt(
		[[
			#include "mainwindow.h"
			#include "ui_mainwindow.h"

			#include <QMessageBox>

			{}::{}(QWidget *parent) :
				QMainWindow(parent),
				ui(new Ui::{})
			{{
				ui->setupUi(this);
			}}

			{}::~{}() {{

			}}

		]], {i(1, "MainWindow"), rep(1), rep(1), rep(1), rep(1)}
		))
	})

end

return functions

