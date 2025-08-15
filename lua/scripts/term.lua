local M = {}

local terms = {}

local function create_float(buf, opts)
  local win_opts = {
    relative = "editor",
    width = math.ceil(opts.width * vim.o.columns),
    height = math.ceil(opts.height * vim.o.lines),
    row = math.ceil(opts.row * vim.o.lines),
    col = math.ceil(opts.col * vim.o.columns),
    style = "minimal",
    border = "rounded",
  }
  vim.api.nvim_open_win(buf, true, win_opts)
end

local function create_split(buf, opts)
  local win_opts = {
    win = vim.api.nvim_get_current_win(),
    split = opts.split,
  }
  if opts.height ~= nil then win_opts.height = math.ceil(opts.height * vim.o.lines) end
  if opts.width ~= nil then win_opts.width = math.ceil(opts.width * vim.o.columns) end
  vim.api.nvim_open_win(buf, true, win_opts)
end

M.new_split = function(opts)
  local buf = vim.api.nvim_create_buf(false, true)
  create_split(buf, opts)
  vim.cmd("startinsert")
  vim.fn.jobstart(vim.o.shell, { term = true })
  vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function() vim.api.nvim_buf_delete(buf, { force = true }) end,
    })
    vim.cmd("setlocal winhl=NormalFloat:Normal,FloatBorder:Normal")
end

M.tggl_split = function(opts)
  local buf = terms[opts.id]
  if buf == nil or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true)
    terms[opts.id] = buf
  end
  local win = vim.fn.bufwinid(buf)
  if win == -1 then
    create_split(buf, opts)
    vim.cmd("startinsert")
  else
    vim.api.nvim_win_close(win, true)
  end
  if vim.bo[buf].buftype ~= "terminal" then
    vim.fn.jobstart(vim.o.shell, { term = true })
    vim.keymap.set("t", opts.toggle, function() M.tggl_split(opts) end, { buffer = buf })
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function() vim.api.nvim_buf_delete(buf, { force = true }) end,
    })
    vim.cmd("setlocal winhl=NormalFloat:Normal,FloatBorder:Normal")
  end

end

M.tggl_float = function(opts)
  local buf = terms[opts.id]
  if buf == nil or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true)
    terms[opts.id] = buf
  end
  local win = vim.fn.bufwinid(buf)
  if win == -1 then
    create_float(buf, opts)
    vim.cmd("startinsert")
  else
    vim.api.nvim_win_close(win, true)
  end
  if vim.bo[buf].buftype ~= "terminal" then
    vim.fn.jobstart(vim.o.shell, { term = true })
    vim.keymap.set("t", opts.toggle, function() M.tggl_float(opts) end, { buffer = buf })
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function() vim.api.nvim_buf_delete(buf, { force = true }) end,
    })
    vim.cmd("setlocal winhl=NormalFloat:Normal,FloatBorder:Normal")
  end
end

M.tggl_float_job = function(opts)
  local buf = terms[opts.id]
  if buf == nil or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true)
    terms[opts.id] = buf
  end
  local win = vim.fn.bufwinid(buf)
  if win == -1 then
    create_float(buf, opts)
    vim.cmd("startinsert")
  else
    vim.api.nvim_win_close(win, true)
  end
  if vim.bo[buf].buftype ~= "terminal" then
    vim.fn.jobstart(opts.job, { term = true })
    vim.keymap.set("t", opts.toggle, function() M.tggl_float_job(opts) end, { buffer = buf })
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = buf,
      callback = function() vim.api.nvim_buf_delete(buf, { force = true }) end,
    })
    vim.cmd("setlocal winhl=NormalFloat:Normal,FloatBorder:Normal")
  end
end

return M
