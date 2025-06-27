vim.g.mapleader = " "

-- Switch between buffers
vim.keymap.set("n", "<leader>h", function()
    local current_win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd w")
    if vim.api.nvim_get_current_win() == current_win then
        return
    end
end, { desc = "Toggle between splits" })

-- Auto-closing quotes and brackets
vim.keymap.set('i', '"<Tab>', '""<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '\'<Tab>', '\'\'<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '(<Tab>', '()<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '[<Tab>', '[]<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '{<Tab>', '{}<Left>', { noremap = true, silent = true })

-- Newline expansions
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true, silent = true })
vim.keymap.set('i', '{;<CR>', '{<CR>};<Esc>O', { noremap = true, silent = true })

