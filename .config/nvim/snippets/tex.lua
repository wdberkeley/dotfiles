-- Snippets for tex files.

-- "Standard" abbreviations.
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
-- End abbreviations.

local snips = {}

-- Common Greek letters.
local gToL = {
  alpha = "a",
  beta = "b",
  gamma = "g",
  delta = "d",
  epsilon = "eps",
  zeta = "z",
  eta = "eta",
  theta = "th",
  iota = "i",
  kappa = "k",
  lambda = "l",
  mu = "m",
  nu = "n",
  xi = "x",
  pi = "pi",
  rho = "r",
  upsilon = "u",
  phi = "phi",
  sigma = "s",
  tau = "ta",
  chi = "c",
  psi = "psi",
  omega = "o",
  varphi = "vphi",
}

for g, ell in pairs(gToL) do
  table.insert(
    snips,
    s(
      { trig = ";l" .. ell, snippetType = "autosnippet" },
      { t("\\" .. g) }
    )
  )
end

-- Common sets of numbers.
local numbers = {
  N = "N",
  Z = "Z",
  Q = "Q",
  R = "R",
  C = "C",
}

for set, ell in pairs(numbers) do
  table.insert(
    snips,
    s(
      { trig = ";N" .. ell },
      { t("\\mathbb{" .. set .. "}") }
    )
  )
end

local bbfmta = fmta("\\mathbb{<>}", { i(1) })
table.insert(snips, s({ trig = ";bb" }, bbfmta))

-- Common notation.
local fffmta = fmta("\\frac{<>}{<>}", { i(1), i(2) })
table.insert(snips, s({trig="ff", dscr="Expands 'ff' into '\\frac{}{}'"}, fffmta))

return snips
