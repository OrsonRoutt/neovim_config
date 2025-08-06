local autocmd = vim.api.nvim_create_autocmd

-- Setup 4 space tab filetypes.
autocmd("FileType", {
  pattern = { "gdscript", "cpp" },
  callback = function()
    vim.bo.sw = 4
    vim.bo.sts = 4
    vim.bo.ts = 4
    vim.bo.expandtab = false
    vim.bo.softtabstop = 4
  end,
})

-- Undotree fix.
autocmd("FileType", {
  pattern = "undotree",
  callback = function()
    vim.schedule(function()
      for i, buf in ipairs(vim.t.bufs) do
        if not vim.bo[buf].buflisted then
          vim.t.bufs = vim.list_slice(vim.t.bufs, 1, i - 1)
        end
      end
      vim.cmd.redrawtabline()
    end)
  end,
})

-- Yank highlight.
autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Setup spell check filetypes.
autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Setup help file types.
vim.api.nvim_create_augroup("FiletypeHelp", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/doc/*.txt",
  callback = function()
    vim.bo.filetype = "help"
  end,
  group = "FiletypeHelp",
})
