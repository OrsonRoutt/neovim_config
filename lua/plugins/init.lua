return {
  { -- LSPConfig
    "neovim/nvim-lspconfig",
    config = function() require("configs.lspconfig") end,
  },
  { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function() return require("configs.treesitter") end,
  },
  { -- Undotree
    "mbbill/undotree",
    init = function() require("inits.undotree") end,
    cmd = "UndotreeToggle",
  },
  { -- Trouble
    "folke/trouble.nvim",
    opts = function() require("configs.trouble") end,
    cmd = "Trouble",
  },
  { -- Nvim-Tree
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvim-tree"),
  },
  { -- Whitespace
    "johnfrankmorgan/whitespace.nvim",
    opts = function() require("configs.whitespace") end,
    event = "User FilePost",
  },
  { -- Grapple
    "cbochs/grapple.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = require("configs.grapple_conf"),
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope-fzf-native.nvim" },
    opts = function() require("configs.telescope") end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  {
    "stevearc/conform.nvim",
    enabled = false,
  },
}
