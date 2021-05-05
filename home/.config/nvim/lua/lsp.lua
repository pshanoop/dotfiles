local lspconfig = require('lspconfig')
local efm = require('efm')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=false, silent=false }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<Leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>E', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>a", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

-- Use a loop to conveniently both setup defined servers and map buffer local
-- keybindings when the language server attaches:
local servers = {
  "jedi_language_server",
  "rls",
  "tsserver",
  "vuels",
  "solargraph", -- ruby
  -- "sorbet",  -- type checker for ruby
  "bashls",
  "gopls",
  "terraformls",
  "vuels",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach }
end

lspconfig.jedi_language_server.setup{
  cmd = { "jedi-language-server", "--verbose", "--log-file", "/home/hugo/tmp/jedi.log" },
  on_attach = on_attach,
}

lspconfig.sumneko_lua.setup{
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    }
  },
  on_attach = on_attach,
}

lspconfig.efm.setup {
  on_attach = on_attach,
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {efm.prettier, efm.eslint},
    }
  },
  filetypes = { "typescript" }
}
