pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "vim", "lua", "vimdoc",
    "html", "css", "gdscript",
    "godot_resource", "gdshader",
    "cpp", "c", "markdown",
    "markdown_inline", "luadoc",
    "printf", "sql", "php",
    "typst",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
