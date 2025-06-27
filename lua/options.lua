vim.wo.number = true -- Numbers in neovim
vim.opt.title = true -- Title of the file
vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])
vim.cmd [[
  highlight! CmpItemAbbr guifg=#ebdbb2
  highlight! CmpItemAbbrMatch guifg=#fabd2f gui=bold
  highlight! CmpItemAbbrMatchFuzzy guifg=#fabd2f gui=bold
  highlight! CmpItemKind guifg=#83a598
  highlight! CmpItemMenu guifg=#b8bb26
  highlight! CmpItemKindFunction guifg=#b8bb26
  highlight! CmpItemKindVariable guifg=#d3869b
  highlight! CmpItemKindKeyword guifg=#fe8019
  highlight! CmpItemKindSnippet guifg=#d65d0e
  highlight! CmpItemKindText guifg=#928374
]]

-- Tab Aesthetics
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "go", "java"},
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.o.splitright = true
