local map = vim.keymap.set

-- Disable arrows in nornal.
map("n", "<left>", "<Nop>", { silent = true, noremap = true })
map("n", "<right>", "<Nop>", { silent = true, noremap = true })
map("n", "<up>", "<Nop>", { silent = true, noremap = true })
map("n", "<down>", "<Nop>", { silent = true, noremap = true })

-- Force remap arrows in insert for 'coq_nvim'.
vim.api.nvim_set_keymap("i", "<up>", 'pumvisible() ? "<C-e><up>" : "<up>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("i", "<down>", 'pumvisible() ? "<C-e><down>" : "<down>"', { expr = true, noremap = true })

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
end, { desc = "toggle mouse enabled" })

-- Window navigation.
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Clear highlights.
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Toggle line number/relative number.
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>N", "<cmd>set nu!<BAR>set rnu!<CR>", { desc = "toggle line and relative number" })

-- Toggle comment.
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Buffer mappings.
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "buffer delete" })
map("n", "<leader>X", "<cmd>bd!<CR>", { desc = "buffer delete without saving" })
map("n", "<leader>bx", function() require("scripts.bclose").delete(false) end, { desc = "buffer delete all" })
map("n", "<leader>bX", function() require("scripts.bclose").delete(true) end, { desc = "buffer delete all without saving" })
map("n", "<leader>bi", function() require("scripts.bclose").isolate(false) end, { desc = "buffer isolate current" })
map("n", "<leader>bI", function() require("scripts.bclose").isolate(true) end, { desc = "buffer isolate current without saving" })
map("n", "<leader>bc", function() require("scripts.bclose").cleanup() end, { desc = "buffer cleanup" })
map("n", "<leader>bt", function() require("scripts.bclose").cleanup_term() end, { desc = "terminal cleanup" })
map("n", "<leader>bT", function() require("scripts.bclose").delete_term() end, { desc = "terminal delete all" })
map("n", "<leader>j", "<cmd>bn<CR>", { desc = "buffer next" })
map("n", "<leader>k", "<cmd>bp<CR>", { desc = "buffer previous" })

-- Quickfix mappings.
map("n", "<M-j>", "<cmd>:cn<CR>", { desc = "quickfix goto next" })
map("n", "<M-k>", "<cmd>:cp<CR>", { desc = "quickfix goto prev" })
map("n", "<M-J>", "<cmd>:clas<CR>", { desc = "quickfix goto last" })
map("n", "<M-K>", "<cmd>:cfir<CR>", { desc = "quickfix goto first" })
map("n", "<M-o>", "<cmd>:cope<CR>", { desc = "quickfix open" })
map("n", "<M-q>", "<cmd>:ccl<CR>", { desc = "quickfix close" })

-- Loclist mappings.
map("n", "<leader><M-j>", "<cmd>:lnext<CR>", { desc = "loclist goto next" })
map("n", "<leader><M-k>", "<cmd>:lprev<CR>", { desc = "loclist goto prev" })
map("n", "<leader><M-J>", "<cmd>:llast<CR>", { desc = "loclist goto last" })
map("n", "<leader><M-K>", "<cmd>:lfirst<CR>", { desc = "loclist goto first" })
map("n", "<leader><M-o>", "<cmd>:lopen<CR>", { desc = "loclist open" })
map("n", "<leader><M-q>", "<cmd>:lclose<CR>", { desc = "loclist close" })

-- Open error float.
map("n", "<leader>E", function() vim.diagnostic.open_float({ focusable = true }) end, { desc = "error open float" })

-- Global LSP mappings.
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Terminal mappings.
map("t", "<ESC><ESC>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<C-x>", "<cmd>bd!<CR>", { desc = "terminal delete" })

-- Telescope mappings.
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope find references" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope find symbols in buffer" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "telescope find symbols in workspace" })
map("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope find definitions" })
map("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "telescope find type definitions" })
map("n", "<leader>fg", "<cmd>Telescope grapple tags<CR>", { desc = "telescope find grapple tags" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

--map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
--map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })

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

-- Whitespace mappings.
map("n", "<leader>tw", function() require("whitespace-nvim").trim() end, { desc = "trim whitespace" })

-- Base46 mappings.
map("n", "<leader>tt", function() require("base46").toggle_theme() end, { desc = "base46 toggle theme" })
map("n", "<leader>T", function() require("base46").toggle_transparency() end, { desc = "base46 toggle transparency" })

-- Yazi mappings.
map("n", "<C-y>", "<cmd>Yazi<CR>", { desc = "open yazi at current file"})
map("n", "<leader><C-Y>", "<cmd>Yazi toggle<CR>", { desc = "toggle yazi" })
map("n", "<leader>c<C-Y>", "<cmd>Yazi cwd<CR>", { desc = "open yazi at current working directory" })

-- NVUI terminal mappings.
map("n", "<leader>h", function() require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })
map("n", "<leader>v", function() require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })
map({ "n", "t" }, "<A-h>", function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-v>", function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })
map({ "n", "t" }, "<A-i>", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- NVUI terminal runners.
local term = require("scripts.term")
map("n", "<C-g>", function()
  term.tggl_float_job({
    id = 0,
    row = 0.05,
    col = 0.05,
    width = 0.9,
    height = 0.8,
    job = "lazygit",
    exit = "q",
    toggle = "<C-g>",
  })
end, { desc = "git toggle lazygit terminal" })

-- Load user commands.
require("user.commands")
