local npairs = require("nvim-autopairs")

_G.user = {}

_G.user.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({"selected"}).selected ~= -1 then
      vim.api.nvim_feedkeys(npairs.esc("<c-y>"), "ni", false)
    else
      vim.api.nvim_feedkeys(npairs.esc("<c-e>") .. npairs.autopairs_cr(), "ni", false)
    end
  else
    vim.api.nvim_feedkeys(npairs.autopairs_cr(), "ni", false)
  end
end

_G.user.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
    vim.api.nvim_feedkeys(npairs.esc("<c-e>") .. npairs.autopairs_bs(), "ni", false)
  else
    vim.api.nvim_feedkeys(npairs.autopairs_bs(), "ni", false)
  end
end

return {
  map_cr = false,
  map_bs = false,
  check_ts = true,
}
