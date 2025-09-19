vim.g.mapleader = " "
vim.g.theme_file = vim.fn.stdpath("data") .. "/theme.lua"

-- Bootstrap Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath}
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy plugins.
require("lazy").setup(require("configs.lazy"))

-- Load theme.
require("scripts.themes").load_theme_file()

-- Setup options/autocmds/mappings.
require("options")
require("autocmds")
require("mappings")
