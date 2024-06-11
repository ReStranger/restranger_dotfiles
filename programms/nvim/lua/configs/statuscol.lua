local statuscol = require "statuscol"
local builtin = require "statuscol.builtin"
statuscol.setup {
  relculright = true,
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    {
      sign = { namespace = { "Diagnostic" }, maxwidth = 2, auto = true },
      click = "v:lua.ScSa",
    },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    {
      sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true },
      click = "v:lua.ScSa",
    },
  },
}
