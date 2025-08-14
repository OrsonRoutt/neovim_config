return {
  "nvim-lua/plenary.nvim",
  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/ui",
    lazy = false,
    config = function() require("nvchad") end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    keys = { "<leader>" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require("nvchad.icons.devicons") }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "┆", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")
      require("ibl").setup(opts)
    end,
  },
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function() return require("configs.mason") end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    config = function() require("configs.lspconfig") end,
    init = function()
      vim.g.coq_settings = require("configs.coq")
    end,
  },
  {
    "johnfrankmorgan/whitespace.nvim",
    opts = function() require("configs.whitespace") end,
    event = "User FilePost",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function() return require("configs.treesitter") end,
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    opts = require("configs.yazi"),
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("configs.grapple_opts"),
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
  },
  {
    "chomosuke/typst-preview.nvim",
    opts = require("configs.typst-preview"),
    cmd = {"TypstPreviewUpdate", "TypstPreview", "TypstPreviewStop", "TypstPreviewToggle"},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    cmd = "Gitsigns",
    opts = function() return require("configs.gitsigns") end,
  },
}
