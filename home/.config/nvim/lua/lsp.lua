local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = { noremap=false, silent=false }
  -- buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<Leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Use a loop to conveniently both setup defined servers and map buffer local
-- keybindings when the language server attaches:
local servers = {
  "jedi_language_server",
  "rls",
  "tsserver",
  "vuels",
  "bashls",
  "gopls",
  "terraformls",
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require'lspconfig'.jedi_language_server.setup{
  cmd = { "jedi-language-server", "--verbose", "--log-file", "/home/hugo/tmp/jedi.log" },
  on_attach = on_attach,
}

require'lspconfig'.sumneko_lua.setup{
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
