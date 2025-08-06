require("nvchad.options")

local opt = vim.opt
local o = vim.o

opt.backspace = { "indent", "eol", "start" }

o.timeoutlen = 300

o.relativenumber = true
