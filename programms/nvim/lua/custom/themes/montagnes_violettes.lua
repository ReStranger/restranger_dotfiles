-- credits to original theme https://github.com/FrenzyExists/aquarium-vim
-- This is just a modified version of it

local M = {}

M.base_30 = {
  white = "#ced4df",
  darker_black = "#15131f",
  black = "#191724", --  nvim bg
  black2 = "#1e1e2e",
  one_bg = "#15131f",
  one_bg2 = "#34343e",
  one_bg3 = "#3e3e48",
  grey = "#484852",
  grey_fg = "#4e4e58",
  grey_fg2 = "#54545e",
  light_grey = "#5a5a64",
  red = "#ebb9b9",
  baby_pink = "#EAC1C1",
  pink = "#E9D1D1",
  line = "#2d2d37", -- for lines like vertsplit
  green = "#b1dba4",
  vibrant_green = "#BEE0A8",
  blue = "#b9a2e7",
  nord_blue = "#9a8dd9",
  yellow = "#E6DFB8",
  sun = "#EEE8BA",
  purple = "#f6bbe7",
  dark_purple = "#E8B6E9",
  teal = "#AEDCB7",
  orange = "#E8CCA7",
  cyan = "#b8dceb",
  statusline_bg = "#15131f",
  lightbg = "#1e1e2e",
  pmenu_bg = "#ebb9b9",
  folder_bg = "#b9a2e7",
}

M.base_16 = {
  base00 = "#191724",
  base01 = "#2c2e3e",
  base02 = "#3D4059",
  base03 = "#313449",
  base04 = "#63718b",
  base05 = "#bac0cb",
  base06 = "#c5cbd6",
  base07 = "#ced4df",
  base08 = "#ebb9b9",
  base09 = "#e8cca7",
  base0A = "#e6dfb8",
  base0B = "#b1dba4",
  base0C = "#b8dceb",
  base0D = "#a3b8ef",
  base0E = "#f6bbe7",
  base0F = "#eAc1c1",
}

M.type = "dark"

M = require("base46").override_theme(M, "montagnes_violettes")

return M
