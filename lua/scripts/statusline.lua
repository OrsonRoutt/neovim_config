local modes = {
  n = {"NORMAL", "Normal"},
  no = {"NORMAL o", "Normal"},
  nov = {"NORMAL ov", "Normal"},
  noV = {"NORMAL oV", "Normal"},
  ["no"] = {"NORMAL o^V", "Normal"},
  niI = {"NORMAL iT", "Normal"},
  niR = {"NORMAL RT", "Normal"},
  niV = {"NORMAL RvT", "Normal"},
  nt = {"NTERMINAL", "Normal"},
  ntT = {"NTERMINAL T", "Normal"},
  v = {"VISUAL", "Visual"},
  vs = {"VISUAL s", "Visual"},
  V = {"V-LINE", "Visual"},
  Vs = {"V-LINE s", "Visual"},
  [""] = {"V-BLOCK", "Visual"},
  ["s"] = {"V-BLOCK s", "Visual"},
  s = {"SELECT", "Select"},
  S = {"S-LINE", "Select"},
  [""] = {"S-BLOCK", "Select"},
  i = {"INSERT", "Insert"},
  ic = {"INSERT c", "Insert"},
  ix = {"INSERT x", "Insert"},
  R = {"REPLACE", "Replace"},
  Rc = {"REPLACE c", "Replace"},
  Rx = {"REPLACE x", "Replace"},
  Rv = {"V-REPLACE", "Replace"},
  Rvc = {"V-REPLACE c", "Replace"},
  Rvx = {"V-REPLACE x", "Replace"},
  c = {"COMMAND", "Command"},
  cr = {"COMMAND r", "Command"},
  cv = {"EX-MODE", "Command"},
  cvr = {"EX-MODE r", "Command"},
  r = {"PROMPT", "Confirm"},
  rm = {"MORE", "Confirm"},
  ["r?"] = {"CONFIRM", "Confirm"},
  ["!"] = {"SHELL", "Terminal"},
  t = {"TERMINAL", "Terminal"},
}

local function get_buf()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

local function get_stl_mode()
  local mode = vim.api.nvim_get_mode().mode
  return "%#Stl_" .. modes[mode][2] .. "Mode#  " .. modes[mode][1] .. " "
end

local function get_stl_file()
  local vals = vim.api.nvim_eval_statusline("%m%r%h%w", {})
  if vals.width > 0 then
    return "%#Stl_Highlight# %f " .. vals.str .. " %#StatusLine#"
  end
  return "%#Stl_Highlight# %f %#StatusLine#"
end

local function get_stl_pos()
  return "%#Stl_Highlight# %l/%L, %c "
end

local function get_stl_after_file()
  local buf = vim.b[get_buf()]
  if not buf.gitsigns_status then return "" end
  local git_data = buf.gitsigns_status_dict
  local gitsigns = " 󰘬 " .. git_data.head
  if git_data.added and git_data.added ~= 0 then gitsigns = gitsigns .. " %#GitSignsAdd# " .. git_data.added end
  if git_data.changed and git_data.changed ~= 0 then gitsigns = gitsigns .. " %#GitSignsChange# " .. git_data.changed end
  if git_data.removed and git_data.removed ~= 0 then gitsigns = gitsigns .. " %#GitSignsDelete# " .. git_data.removed end
  return gitsigns .. "%#StatusLine#"
end

local function get_stl_before_pos()
  return ""
end

_G.get_statusline = function()
  return string.format(
    "%s%s%s%%=%s%s",
    get_stl_mode(),
    get_stl_file(),
    get_stl_after_file(),
    get_stl_before_pos(),
    get_stl_pos()
  )
end
