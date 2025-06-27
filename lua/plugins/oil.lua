local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    columns = {
        "icon"
    },
    buf_options = {
        buflisted = false,
        bufhidden = "hide",
    },
    win_options = {
        wrap = true,
        signcolumn = "yes",
        cursorcolumn = true,
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },
    keymaps = {
        ["<CR>"] = function()
            local entry = oil.get_cursor_entry()
            if entry and entry.type == "directory" then
                oil.select()
            else
                oil.select({vertical = true})
            end
        end,
    },
    confirmation = {
        max_width = 0.25,
        min_width = 0.25,
        width = 0.25
    }
})


vim.keymap.set("n", "<c-e>", function()
    local total_columns = vim.o.columns
    local oil_width = math.floor(total_columns * 0.25)
    vim.cmd(string.format("vsplit | wincmd h | vertical resize %d | setlocal winfixwidth", oil_width))
    oil.open()
end)

vim.api.nvim_create_augroup("MyOil", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
  group = "MyOil",
  callback = function()
    if vim.bo.buftype == "acwrite" then
        local total_columns = vim.o.columns
        local oil_width = math.floor(total_columns * 0.25)       -- Set height
        vim.cmd(string.format("vertical resize %d | setlocal winfixwidth", oil_width))
    end-- Set width
  end,
})
