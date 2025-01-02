local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local functions = {}

function functions.add_snip()

	-- Functional Component Snippet
  ls.add_snippets("typescriptreact", {
    s("rfc", fmt(
      [[
        import React from "react";

        interface {}Props {{
          {}
        }}

        const {}: React.FC<{}Props> = ({}) => {{
          return (
            <>
              {}
            </>
          );
        }}

        export default {};
      ]],
      { i(1, "Component"), i(2, "// Props definition"), rep(1), rep(1), i(3, "props"), i(4, "// JSX here"), rep(1) }
    ))
  })

  -- useState Hook Snippet
  ls.add_snippets("typescriptreact", {
    s("us", fmt(
      [[
        const [{}{}, set{}] = useState<{}>({});
      ]],
      { i(1, "state"), t(""), rep(1), i(2, "Type"), i(3, "defaultValue") }
    ))
  })

  -- useEffect Hook Snippet
  ls.add_snippets("typescriptreact", {
    s("ue", fmt(
      [[
        useEffect(() => {{
          {}
        }}, [{}]);
      ]],
      { i(1, "// Effect logic"), i(2, "// Dependencies") }
    ))
  })

  -- Custom Hook Template
  ls.add_snippets("typescriptreact", {
    s("hook", fmt(
      [[
        import {{ useState, useEffect }} from "react";

        const use{} = (): {} => {{
          const [{}{}, set{}] = useState<{}>(null);

          useEffect(() => {{
            {}
          }}, []);

          return {};
        }}

        export default use{};
      ]],
      { i(1, "CustomHook"), i(2, "ReturnType"), i(3, "state"), t(""), rep(3), i(4, "StateType"), i(5, "// Logic here"), i(6, "value"), rep(1) }
    ))
  })

  -- Styled Component Snippet
  ls.add_snippets("typescriptreact", {
    s("styled", fmt(
      [[
        import styled from "styled-components";

        const {} = styled.{}`
          {};
        `;

        export default {};
      ]],
      { i(1, "Component"), i(2, "div"), i(3, "// Styles here"), rep(1) }
    ))
  })

  -- Basic JSX Element Snippet
  ls.add_snippets("typescriptreact", {
    s("jsx", fmt(
      [[
        <{} {}>{}</{}>;
      ]],
      { i(1, "div"), i(2, "// Props"), i(3, "Children"), rep(1) }
    ))
  })

end

return functions
