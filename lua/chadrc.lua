---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "horizon",
  theme_toggle = { "horizon", "flexoki" },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  transparency = false,
}

M.ui = {
  statusline = {
    order = { "mode", "filep", "git", "%=", "lsp_msg", "%=", "grapple", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      grapple = function()
        return require("grapple").statusline()
      end,
      filep = function()
        local config = require("nvconfig").ui.statusline
        local sep_style = config.separator_style
        local utils = require("nvchad.stl.utils")
        local sep_icons = utils.separators
        local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]
        local sep_r = separators["right"]
        local mod = vim.api.nvim_get_option_value("mod", { buf = utils.stbufnr() }) and "+" or ""
        local x = utils.file()
        local name = " " .. x[2] .. mod .. (sep_style == "default" and " " or "")
        return "%#St_file# " .. x[1] .. name .. "%#St_file_sep#" .. sep_r
      end,
    },
  },
  tabufline = {
    enabled = false,
  },
}

return M
