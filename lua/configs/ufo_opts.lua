return {
  open_fold_hl_timeout = 150,
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end
}
