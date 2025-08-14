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
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "function block" },
        ["if"] = { query = "@function.inner", desc = "inner function" },
        ["ac"] = { query = "@class.outer", desc = "class block" },
        ["ic"] = { query = "@class.inner", desc = "inner class" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = { query = "@function.outer", desc = "Next function start" },
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
      },
      goto_next_end = {
        ["]M"] = { query = "@function.outer", desc = "Next function end" },
        ["]["] = { query = "@class.outer", desc = "Next class end" },
      },
      goto_previous_start = {
        ["[m"] = { query = "@function.outer", desc = "Previous function start" },
        ["[]"] = { query = "@class.outer", desc = "Previous class start" },
      },
      goto_previous_end = {
        ["[M"] = { query = "@function.outer", desc = "Previous function end" },
        ["[["] = { query = "@class.outer", desc = "Previous class end" },
      },
    },
  },
}
