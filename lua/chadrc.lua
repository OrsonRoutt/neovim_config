---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "flexoki",
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
  theme_toggle = { "horizon", "flexoki" },
}

M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "grapple", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      grapple = function()
        return require("grapple").statusline()
      end,
    },
  },
  tabufline = {
    order = { "treeOffset", "buffers", "tabs" },
  },
}

M.term = {
  float = {
    row = 0.05,
    col = 0.05,
    width = 0.9,
    height = 0.8,
  },
}

return M
