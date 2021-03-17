vim.g.blamer_enabled = 1

-- Don't have any delay. The delay gives an impression of laggyness.
vim.g.blamer_delay = 0

-- In visual mode it's visually annoying AND slows down Vim A LOT.
vim.g.blamer_show_in_visual_modes = 0

-- Default date format does not make sense.
-- Can upstream make it localed-dependant?
vim.g.blamer_date_format = '%Y-%m-%d'

vim.api.nvim_set_keymap(
  'n',
  '<Leader>b',
  [[:let g:blamer_enabled = !g:blamer_enabled<cr>]],
  {silent = true, noremap = true, expr = false}
)
