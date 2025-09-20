vim.g.mapleader = " "

-- Bootstrap Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath}
end
vim.opt.rtp:prepend(lazypath)

-- Setup themes.
require("themes")

-- Setup Lazy plugins.
require("lazy").setup(require("configs.lazy"))

-- Setup options/autocmds/mappings.
require("options")
require("autocmds")
require("mappings")
