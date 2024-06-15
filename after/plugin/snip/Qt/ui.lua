
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local functions = {}

function functions.add_snip()
	ls.add_snippets("xml", {
			s("newWindow", fmt(
			[[
				<?xml version="1.0" encoding="UTF-8"?>
				<ui version="4.0">
				<class>{}</class>
				<widget class="QMainWindow" name="{}">
					<property name="geometry">
					<rect>
						<x>0</x>
						<y>0</y>
						<width>800</width>
						<height>600</height>
					</rect>
					</property>
					<property name="windowTitle">
						<string>MainWindow</string>
					</property>
				</widget>
				<resources/>
				<connections/>
				</ui>
			]], {i(1, "MainWindow"), i(2, "MainWindow")}
			))
	})

	ls.add_snippets("xml", {
			s("newWidget", fmt(
			[[
				<widget class="QWidget" name="{}">
					{}
				</widget>
			]], {i(1), i(0)}
			))
	})

	ls.add_snippets("xml", {
			s("button", fmt(
			[[
				<widget class="QPushButton" name="{}">
					<property name="geometry">
					<rect>
						<x>50</x>
						<y>40</y>
						<width>80</width>
						<height>25</height>
					</rect>
					</property>
					<property name="text">
					<string>{}</string>
					</property>
				</widget>
			]], {i(1), i(0)}
			))
	})

	ls.add_snippets("xml", {
			s("label", fmt(
			[[
				<widget class="QLabel" name="{}">
					<property name="geometry">
					<rect>
						<x>50</x>
						<y>40</y>
						<width>80</width>
						<height>25</height>
					</rect>
					</property>
					<property name="text">
					<string>{}</string>
					</property>
				</widget>
			]], {i(1), i(0)}
			))
	})

	ls.add_snippets("xml", {
			s("verticalLayout", fmt(
			[[
				<layout class="QVBoxLayout" name="{}">
					<item>

					</item>
					<item>

					</item>
				</layout>
			]], {i(1)}
			))
	})

	ls.add_snippets("xml", {
			s("horizontalLayout", fmt(
			[[
				<layout class="QHBoxLayout" name="{}">
					<item>

					</item>
					<item>

					</item>
				</layout>
			]], {i(1)}
			))
	})

	ls.add_snippets("xml", {
			s("gridlLayout", fmt(
			[[
				<layout class="QGridLayout" name="{}">
					<item row="1" column="1">

					</item>
					<item row="1" column="1">

					</item>
				</layout>
			]], {i(1)}
			))
	})

	ls.add_snippets("xml", {
			s("formLayout", fmt(
			[[
				<layout class="QFormLayout" name="{}">
					<item row="0" column="0">
					
					</item>
					<item row="0" column="1">
					
					</item>
					<item row="1" column="1">

					</item>
					<item row="2" column="0" colspan="2">
					
					</item>
				</layout>
			]], {i(1)}
			))
	})

	ls.add_snippets("xml", {
			s("menuBar", fmt(
			[[
				<widget class="QMenuBar" name="menuBar">
				<property name="geometry">
					<rect>
					<x>0</x>
					<y>0</y>
					<width>800</width>
					<height>21</height>
					</rect>
				</property>
				<widget class="QMenu" name="menuFile">
					<property name="title">
						<string>File</string>
					</property>
					<addaction name="actionNew"/>
					<addaction name="actionOpen"/>
					<addaction name="actionSave"/>
					<addaction name="actionExit"/>
				</widget>
				<widget class="QMenu" name="menuEdit">
					<property name="title">
						<string>Edit</string>
					</property>
					<addaction name="actionCut"/>
					<addaction name="actionCopy"/>
					<addaction name="actionPaste"/>
				</widget>
				<addaction name="menuFile"/>
				<addaction name="menuEdit"/>
				</widget>
				<widget class="QStatusBar" name="statusBar"/>
				<action name="actionNew">
				<property name="text">
					<string>New</string>
				</property>
				</action>
				<action name="actionOpen">
				<property name="text">
					<string>Open</string>
				</property>
				</action>
				<action name="actionSave">
				<property name="text">
					<string>Save</string>
				</property>
				</action>
				<action name="actionExit">
				<property name="text">
					<string>Exit</string>
				</property>
				</action>
				<action name="actionCut">
				<property name="text">
					<string>Cut</string>
				</property>
				</action>
				<action name="actionCopy">
				<property name="text">
					<string>Copy</string>
				</property>
				</action>
				<action name="actionPaste">
				<property name="text">
					<string>Paste</string>
				</property>
				</action>
			]], {}
			))
	})

	ls.add_snippets("xml", {
			s("formLayout", fmt(
			[[
				<widget class="QLineEdit" name="{}">
				
				</widget>
			]], {i(1)}
			))
	})
	
end

return functions

