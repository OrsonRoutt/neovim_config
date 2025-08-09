vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

-- Bootstrap Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {"git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath}
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy plugins.
local lazy_config = require("configs.lazy")
require("lazy").setup(lazy_config)

-- Load theme.
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Setup options/autocmds/mappings.
require("options")
require("autocmds")
vim.schedule(function()
  require("mappings")
end)
