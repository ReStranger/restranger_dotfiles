require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- -- UFO
map("n", "zR", require("ufo").openAllFolds, { desc = "UFO Open all folds" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "UFO Close all folds" })
map("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "UFO LSP hover" })

-- DEBUGGER
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "DAP Open debugging sidebar" })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "DAP Python test method" })

map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "DAP Update crates" })
