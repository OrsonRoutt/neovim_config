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

local function get_mode()
  local mode = vim.api.nvim_get_mode().mode
  return "%#Stl_" .. modes[mode][2] .. "#  " .. modes[mode][1] .. " %#Normal#"
end

_G.get_statusline = function()
  return string.format(
    "%s %s%%=%s",
    get_mode(),
    "[%n] %f %m%r%h%w",
    " %l/%L, %c "
  )
end
