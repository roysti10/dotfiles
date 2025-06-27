require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls" }, -- auto-installs lua-language-server
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local util = require("lspconfig/util")


require("mason-lspconfig").setup({
  handlers = {
  function(server_name)
    lspconfig[server_name].setup({})
  end,

  -- Custom handler for Lua
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("init.lua"),
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT", -- Neovim uses LuaJIT
          },
          diagnostics = {
            globals = { "vim" }, -- recognize `vim` as a global
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true), -- full runtime path
            checkThirdParty = false, -- disable 3rd party checking
          },
          telemetry = {
            enable = false, -- disable telemetry
          },
          completion = {
            callSnippet = "Replace", -- better snippet completion
          },
        },
      },
    })
  end,

  ["gopls"] = function()
      lspconfig.gopls.setup({
        capabilities = capabilities,
        root_dir = util.root_pattern("go.mod",".git"),
        settings = {
            gopls = {
                gofumpt = true,
                analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
            },
        },
    })
  end
  }
})

