local api = vim.api
local fn = vim.fn

local delay = 250 -- ms

local autosave = api.nvim_create_augroup("autosave", { clear = true })
-- Initialization
api.nvim_create_autocmd("BufRead", {
    pattern = "*",
    group = autosave,
    callback = function(ctx)
        api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
        api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
    end,
})

api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = "*",
    group = autosave,
    callback = function(ctx)
        -- conditions that donnot do autosave
        local disabled_ft = { "acwrite", "oil" }
        if
            not vim.bo.modified
            or fn.findfile(ctx.file, ".") == "" -- a new file
            or ctx.file:match("wezterm.lua")
            or vim.tbl_contains(disabled_ft, vim.bo[ctx.buf].ft)
        then
            return
        end

        local ok, queued = pcall(api.nvim_buf_get_var, ctx.buf, "autosave_queued")
        if not ok then
            return
        end

        if not queued then
            vim.cmd("silent w")
            api.nvim_buf_set_var(ctx.buf, "autosave_queued", true)
            vim.notify("Saved at " .. os.date("%H:%M:%S"))
        end

        local block = api.nvim_buf_get_var(ctx.buf, "autosave_block")
        if not block then
            api.nvim_buf_set_var(ctx.buf, "autosave_block", true)
            vim.defer_fn(function()
                if api.nvim_buf_is_valid(ctx.buf) then
                    api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
                    api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
                end
            end, delay)
        end
    end,
})
