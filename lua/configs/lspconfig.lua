local map = vim.keymap.set
local lspconfig = require("lspconfig")

local function on_attach(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("go to definition"))
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts("go to type definition"))
  map("n", "<leader>ra", require("scripts.lsp_rename"), opts("rename"))
end

local function on_init(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.inlineCompletionProvider = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  snippetSupport = false,
}

-- Default configured servers.
for _, lsp in ipairs({"gdscript", "sqls", "phpactor"}) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- clangd
lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--query-driver=/usr/local/bin/g++-14",
    "-header-insertion=never",
  },
}

-- tinymist
lspconfig.tinymist.setup {
  on_attach = function(_, bufnr)
    on_attach(nil, bufnr)
    map("n", "<leader>tp", "<cmd>:TypstPreview<CR>", { buffer = bufnr, desc = "typst present" })
    map("n", "<leader>tc", "<cmd>:TypstPreviewStop<CR>", { buffer = bufnr, desc = "typst stop present"})
    map("n", "<leader>te", "<cmd>!typst c %:.<CR>", { buffer = bufnr, desc = "typst export to pdf" })
  end,
  on_init = on_init,
  capabilities = capabilities,
}

-- lua_ls
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  },
  cmd = { "lua-language-server", "--force-accept-workspace" },
}
