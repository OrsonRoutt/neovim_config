return {
  open_fold_hl_timeout = 150,
  provider_selector = function(_, _, _) return { "treesitter", "indent" } end,
  preview = {
    mappings = {
      scrollB = "",
      scrollF = "",
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      scrollE = "",
      scrollY = "",
      jumpTop = "",
      jumpBot = "",
      close = "q",
      switch = "<Tab>",
      trace = "<CR>",
    },
  },
}
