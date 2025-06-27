require('nvim-treesitter.configs').setup{
    ensure_installed = {"lua", "go", "gomod", "gosum"},
    highlight = {
        enable = true,
    }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldminlines = 25
vim.opt.foldnestmax = 5




