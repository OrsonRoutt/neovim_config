dofile(vim.g.base46_cache .. "cmp")

local cmp = require("cmp")

return {
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping(function(callback)
      if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert})
      else callback() end
    end, {"i","s"}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else fallback() end
    end, {"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else fallback() end
    end, {"i","s"}),
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    { name = "nvim_lua" },
    { name = "async_path" },
  },
}
