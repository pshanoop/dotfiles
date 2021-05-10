local lspconfig = require('lspconfig')
local efm = require('efm')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=false, silent=false }
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<Leader>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<Leader>E', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<Leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("v", "<space>a", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

  lsp_status.on_attach(client, bufnr)
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
  -- "sourcekit",  -- swift
  "bashls",
  "gopls",
  "terraformls",
  "vuels",
  -- docker: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
  -- json: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls
  -- yaml: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#yamlls
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
  }
end

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
  capabilities = lsp_status.capabilities,
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = efm.languages,
  },
  filetypes = efm.filetypes,
  on_attach = on_attach,
  capabilities = lsp_status.capabilities,
}

-- Logs to ~/.cache/nvim/lsp.log
-- vim.lsp.set_log_level("debug")
