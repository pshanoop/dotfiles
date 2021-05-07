require('symbols-outline').setup({})

vim.api.nvim_set_keymap(
  'n',
  '<Leader>v',
  "<Cmd>SymbolsOutline<CR>",
  { noremap = true, silent = false, expr = false}
)

-- TODO: Make this wider. Ideally, as big as necessary to fit everything,
-- to a max of 50 chars.
