require("nvchad.mappings")

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Disable arrow keys in normal.
map("n", "<left>", "<Nop>", { silent = true, noremap = true })
map("n", "<right>", "<Nop>", { silent = true, noremap = true })
map("n", "<up>", "<Nop>", { silent = true, noremap = true })
map("n", "<down>", "<Nop>", { silent = true, noremap = true })

-- Toggle mouse.
map("n", "<leader>M", function()
  if (vim.api.nvim_get_option_value("mouse", {}) ~= "a") then
    print("enabled mouse")
    vim.opt.mouse = "a"
    vim.opt.mousescroll = "ver:3,hor:6"
  else
    print("disabled mouse")
    vim.opt.mouse = ""
    vim.opt.mousescroll= "ver:0,hor:0"
  end
end, { noremap = true, desc = "toggle mouse enabled" })
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"

-- Telescope actions.
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope find references" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope find symbols in buffer" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "telescope find symbols in workspace" })
map("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope find definitions" })
map("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "telescope find type definitions" })
map("n", "<leader>fg", "<cmd>Telescope grapple tags<CR>", { desc = "telescope find grapple tags" })

-- Grapple actions.
map("n", "<leader>gt", "<cmd>Grapple toggle<CR>", { desc = "grapple toggle tag" })
map("n", "<leader>gT", "<cmd>Grapple toggle_tags<CR>", { desc = "grapple toggle tags window" })
map("n", "<leader>gn", "<cmd>Grapple cycle_tags next<CR>", { desc = "grapple cycle next tag" })
map("n", "<leader>gp", "<cmd>Grapple cycle_tags prev<CR>", { desc = "grapple cycle previous tag" })
map("n", "<leader>g1", "<cmd>Grapple select index=1<CR>", { desc = "grapple select tag 1" })
map("n", "<leader>g2", "<cmd>Grapple select index=2<CR>", { desc = "grapple select tag 2" })
map("n", "<leader>g3", "<cmd>Grapple select index=3<CR>", { desc = "grapple select tag 3" })
map("n", "<leader>g4", "<cmd>Grapple select index=4<CR>", { desc = "grapple select tag 4" })
map("n", "<leader>g5", "<cmd>Grapple select index=5<CR>", { desc = "grapple select tag 5" })
map("n", "<leader>g6", "<cmd>Grapple select index=6<CR>", { desc = "grapple select tag 6" })
map("n", "<leader>g7", "<cmd>Grapple select index=7<CR>", { desc = "grapple select tag 7" })
map("n", "<leader>g8", "<cmd>Grapple select index=8<CR>", { desc = "grapple select tag 8" })
map("n", "<leader>g9", "<cmd>Grapple select index=9<CR>", { desc = "grapple select tag 9" })
map("n", "<leader>gS", "<cmd>Grapple toggle_scopes<CR>", { desc = "grapple toggle scopes window" })
map("n", "<leader>gL", "<cmd>Grapple toggle_loaded<CR>", { desc = "grapple toggle loaded scopes window" })

-- Tabufline actions.
map("n", "<leader>X", function() require("nvchad.tabufline").closeAllBufs() end, { desc = "buffer close all" })
map("n", "<leader>I", function() require("nvchad.tabufline").closeAllBufs(false) end, { desc = "buffer isolate current" })
for i = 1, 9, 1 do
  map("n", string.format("<A-%s>", i), function()
    local b = vim.t.bufs[i]
    if b then vim.api.nvim_set_current_buf(b) end
  end, { desc = string.format("buffer goto %s", i) })
end
map("n", "<A-0>", function()
  local b = vim.t.bufs[10]
  if b then vim.api.nvim_set_current_buf(b) end
end, { desc = "buffer goto 10" })
map("n", "<leader>k", function() require("nvchad.tabufline").move_buf(-1) end, { desc = "move buffer left" })
map("n", "<leader>j", function() require("nvchad.tabufline").move_buf(1) end, { desc = "move buffer right" })

-- nvim-tree focus rebind.
map("n", "<leader><tab>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
unmap("n", "<leader>e")

-- Expand error into a float.
map("n", "<leader>E", function() vim.diagnostic.open_float({ focusable = true }) end, { desc = "error open float" })

-- Undotree toggle.
map("n", "<leader>u", function() vim.cmd.UndotreeToggle() end, { desc = "undotree toggle" })

-- Unbind conform.
unmap("n", "<leader>fm")

-- Trouble actions.
map("n", "<leader>ee", "<cmd>Trouble diagnostics toggle<CR>", { desc = "trouble toggle diagnostics" })
map("n", "<leader>eE", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "trouble toggle buffer diagnostics" })
map("n", "<leader>el", "<cmd>Trouble lsp toggle focus=false<CR>", { desc = "trouble toggle lsp" })
map("n", "<leader>ef", "<cmd>Trouble diagnostics open focus=true<CR>", { desc = "trouble focus diagnostics" })
map("n", "<leader>eF", "<cmd>Trouble lsp open focus=true<CR>", { desc = "trouble focus lsp" })

-- Easier cd to current file.
map("n", "<leader>cd", "<cmd>:cd %:h<CR>", { desc = "cd to open file directory" })

-- Quickfix actions.
map("n", "<M-j>", "<cmd>:cn<CR>", { desc = "quickfix goto next" })
map("n", "<M-k>", "<cmd>:cp<CR>", { desc = "quickfix goto prev" })
map("n", "<M-J>", "<cmd>:clas<CR>", { desc = "quickfix goto last" })
map("n", "<M-K>", "<cmd>:cfir<CR>", { desc = "quickfix goto first" })
map("n", "<M-o>", "<cmd>:cope<CR>", { desc = "quickfix open" })
map("n", "<M-q>", "<cmd>:ccl<CR>", { desc = "quickfix close" })

-- Loclist actions.
map("n", "<leader><M-j>", "<cmd>:lnext<CR>", { desc = "loclist goto next" })
map("n", "<leader><M-k>", "<cmd>:lprev<CR>", { desc = "loclist goto prev" })
map("n", "<leader><M-J>", "<cmd>:llast<CR>", { desc = "loclist goto last" })
map("n", "<leader><M-K>", "<cmd>:lfirst<CR>", { desc = "loclist goto first" })
map("n", "<leader><M-o>", "<cmd>:lopen<CR>", { desc = "loclist open" })
map("n", "<leader><M-q>", "<cmd>:lclose<CR>", { desc = "loclist close" })

-- Base46 theme toggle.
map("n", "<leader>tt", function() require("base46").toggle_theme() end, { desc = "base46 toggle theme" })

-- Terminal remapping.
unmap("t", "<C-x>")
map("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "terminal escape terminal mode" })
unmap("n", "<leader>v")
unmap({"n", "t"}, "<A-v>")

-- Terminal runners.
map({"n", "t"}, "<C-g>", function()
  require("nvchad.term").toggle{ pos = "float", id = "lazygit", cmd = "lazygit;exit" }
end, { desc = "git toggle lazygit terminal" })

map({"n", "t"}, "<C-y>", function()
  require("nvchad.term").toggle{ pos = "float", id = "yazi", cmd = "yazi;exit" }
end, { desc = "toggle yazi terminal" })

-- Whitespace actions.
map("n", "<leader>tw", function() require("whitespace-nvim").trim() end, { desc = "trim whitespace" })

-- Load user commands.
require("user.commands")
