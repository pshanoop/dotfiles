require('symbols-outline').setup({})

vim.api.nvim_set_keymap(
  'n',
  '<Leader>v',
  "<Cmd>SymbolsOutline<CR>",
  { noremap = true, silent = false, expr = false}
)
