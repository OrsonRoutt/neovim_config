local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")

local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")
local actions = require("telescope.actions")

local function get_terms()
  return vim.tbl_filter(
    function(buf)
      return vim.bo[buf].buftype == "terminal"
    end, vim.api.nvim_list_bufs())
end

M.ts_terms = function(opts)
  opts = opts or {}

  local bufnrs = get_terms()
  if #bufnrs == 0 then
    print("no terminal buffers are open")
    return
  end

  local bufs = {}
  for _, buf in ipairs(bufnrs) do
    table.insert(bufs, { bufnr = buf, flag = "", info = vim.fn.getbufinfo(buf)[1] })
  end

  if not opts.bufnr_width then
    opts.bufnr_width = #tostring(math.max(unpack(bufnrs)))
  end

  pickers.new(opts, {
    prompt_title = "Terminals",
    finder = finders.new_table {
      results = bufs,
      entry_maker = make_entry.gen_from_buffer(opts),
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
      map({ "i", "n" }, "<M-d>", actions.delete_buffer)
      return true
    end,
  }):find()
end

return M
