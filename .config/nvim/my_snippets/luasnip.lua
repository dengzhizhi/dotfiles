local ls = require "luasnip"
-- Snippet creator
local s = ls.s
local t = ls.t
local f = ls.f

-- A format node.
-- It takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

-- An insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node
-- rep(<position)
local rep = require("luasnip.extras").rep

-- Generate a uuid
local random = math.random
local function uuid()
  math.randomseed(os.time())
  local template ='xxxxxxxx-xxxx-7xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function (c)
    local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
    return string.format('%x', v)
  end)
end

local dateTagLambda = function(args, snip) return os.date("<%Y-%m-%d %a>") end
local uuidLambda = function(args, snip) return uuid() end

ls.add_snippets("all", {
    s("uuid", {
      f(uuidLambda, {})
    }),
})

ls.add_snippets("markdown", {
  s("#d", {
    t("# "),
    f(dateTagLambda, {}),
    t(" ")
  }),
  s("##d", {
    t("## "),
    f(dateTagLambda, {}),
    t(" ")
  }),
  s("###d", {
    t("### "),
    f(dateTagLambda, {}),
    t(" ")
  }),
})

ls.add_snippets("org", {
  s("*d", {
    t("* "),
    f(dateTagLambda, {}),
    t(" ")
  }),
  s("**d", {
    t("** "),
    f(dateTagLambda, {}),
    t(" ")
  }),
  s("***d", {
    t("*** "),
    f(dateTagLambda, {}),
    t(" ")
  }),
  s("title", {
    t("#+TITLE: "), i(0),
    t({
      "",
      [[#+STARTUP: hideblocks]],
      [[#+INFOJS_OPT: view:t toc:t ltoc:t mouse:underline buttons:0 path:http://dengzhizhi.github.io/solarized-css/org-info.min.js"]],
      [[#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://dengzhizhi.github.io/solarized-css/solarized-light.min.css" />]],
      [[#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://dengzhizhi.github.io/solarized-css/blockquote.css" />]],
    }),
  })
})

-- ls.snippets = {
--   all = {
--     s("uuid", {
--       f(uuidLambda, {})
--     })
--   },

--   javascript = {

--   },

--   org = {
--     s("*d", {
--       t("* "),
--       f(dateTagLambda, {})
--     }),
--     s("**d", {
--       t("** "),
--       f(dateTagLambda, {})
--     }),
--     s("***d", {
--       t("*** "),
--       f(dateTagLambda, {})
--     }),
--     s("title", {
--       t("#+TITLE: "), i(0),
--       t({
--         "",
--         [[#+STARTUP: hideblocks]],
--         [[#+INFOJS_OPT: view:t toc:t ltoc:t mouse:underline buttons:0 path:http://dengzhizhi.github.io/solarized-css/org-info.min.js"]],
--         [[#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://dengzhizhi.github.io/solarized-css/solarized-light.min.css" />]],
--         [[#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="http://dengzhizhi.github.io/solarized-css/blockquote.css" />]],
--       }),
--     })
--   }
-- }
