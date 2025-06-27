require "paq" {
    "savq/paq-nvim",
    { "ibhagwan/fzf-lua",
        dependencies = { "echasnovski/mini.icons" , opts = {} },
        opts = {}
    },
    { "stevearc/oil.nvim" ,
        dependencies =  {"echasnovski/mini.icons", opts={} },
        opts = {}
    },
    "morhetz/gruvbox",
    {"echasnovski/mini.icons", opts={} },
    { "nvim-treesitter/nvim-treesitter",
        branch = "master",
        build = ":TSUpdate"
    },
    {"mason-org/mason.nvim", opts = {} },
    {"neovim/nvim-lspconfig", opts = {} },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = {}
    },
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
}

require("plugins.mason")
require("mini.icons").setup()
require("plugins.autosave")
require("keymaps")
require("options")
require("plugins.oil")
require("plugins.cmp")
require("plugins.treesitter")


