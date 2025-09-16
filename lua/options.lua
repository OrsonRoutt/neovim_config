local opt = vim.opt
local o = vim.o
local g = vim.g

o.laststatus = 3
o.showmode = false
o.ruler = true

o.clipboard = "unnamedplus"

o.cursorline = true
o.cursorlineopt = "number"

o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.backspace = "indent,eol,start"

o.ignorecase = true
o.smartcase = true

o.mouse = ""
o.mousescroll = "ver:0,hor:0"

o.number = true
o.relativenumber = true
o.numberwidth = 2

opt.shortmess:append("sI")

o.signcolumn = "yes"

o.splitkeep = "screen"
o.splitbelow = true
o.splitright = true

o.timeoutlen = 300

o.undofile = true

o.updatetime = 250

vim.cmd("set nocompatible")
vim.cmd("filetype plugin on")
vim.cmd("syntax on")

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

local win = vim.fn.has("win32") ~= 0
local sep = win and "\\" or "/"
local delim = win and ";" or ":"
vim.env.PATH = vim.fn.stdpath("data") .. sep .. "mason" .. sep .. "bin" .. delim .. vim.env.PATH
