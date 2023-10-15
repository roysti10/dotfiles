require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end)
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end)
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end)
map({ "n", "i" }, "<C-M-f>", "<cmd>Telescope live_grep<Cr>") 
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
