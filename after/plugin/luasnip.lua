-- Файл для создания снипетов для различный
-- языков программирования
local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local current_dir = vim.fn.expand('<sfile>:p:h')
local snip_path = current_dir .. '/snip/?.lua'

-- Добавляем директорию с модулем в package.path
package.path = package.path .. ';' .. snip_path

--React Type Tag
local tags = require('reactTS.tags') -- Указываем относительный путь к модулю
tags.add_snip()

local functions = require('reactTS.functions') -- Указываем относительный путь к модулю
functions.add_snip()

-- server.ts
local server = require('typescript.server') -- Указываем относительный путь к модулю
server.add_snip()



