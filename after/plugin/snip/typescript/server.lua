local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local server = {}

function server.add_snip()
	ls.add_snippets("typescript", {
		s("app", fmt(
			[[
				import express from 'express';
				import fs from 'fs';
				import path from 'path';
				import cors from 'cors';
				import color from 'colors';
				import bodyParser from 'body-parser'

				const app = express();
				const PORT = {};
				
				app.use(cors());
				app.use(bodyParser.json());

				app.get('/', (req: any, res: any) => {{
					console.log(req.body);
					res.send('Всё тип топ')
				}})

				app.listen(PORT, () => console.log(color.green("Сервер запущен, батеньки...")));
			]], {
				i(0)		
			}
		))
	})

	ls.add_snippets("javascript", {
		s("axiosConfig", fmt(
		[[
			const {} = (url, data) => {{
				return {{
					method: "{}",
					url: URL + url,
					headers: {{}},
					data: data
				}}
			}};
		]], {i(1), i(0)}
		))
	})


end

return server 
