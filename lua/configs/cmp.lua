dofile(vim.g.base46_cache .. "cmp")

local cmp = require("cmp")

cmp.setup.filetype({"typst"}, {
  completion = {
    keyword_length = 2,
  },
})

cmp.setup.filetype({"lua"}, {
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  },
})

return {
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<C-e>"] = cmp.mapping(function(_) cmp.close() end, {"i","s"}),
    ["<C-Space>"] = cmp.mapping(function(_) cmp.complete() end, {"i","s"}),
    ["<CR>"] = cmp.mapping(function(fb)
      if cmp.visible() then
        if cmp.get_selected_entry() then
          cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert})
        else cmp.close() fb() end
      else fb() end
    end, {"i","s"}),
    ["<Tab>"] = cmp.mapping(function(fb) if cmp.visible() then cmp.select_next_item() else fb() end
    end, {"i","s"}),
    ["<S-Tab>"] = cmp.mapping(function(fb) if cmp.visible() then cmp.select_prev_item() else fb() end
    end, {"i","s"}),
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" }, -- Not running because I find it annoying.
    -- { name = "async_path" },
  },
}
