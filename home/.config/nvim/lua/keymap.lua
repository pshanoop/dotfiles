-- Switch from vertical split into horizontal split
vim.api.nvim_set_keymap(
  'n',
  '<Leader>th',
  "<C-w>t<C-w>K",
  { noremap = true, silent = false, expr = false}
)

-- Switch from horitonzal split into vertical split
vim.api.nvim_set_keymap(
  'n',
  '<Leader>tv',
  "<C-w>t<C-w>H",
  { noremap = true, silent = false, expr = false}
)

-- Ctrl-w followed by H, J, K or L will move the current window to the far
-- left, bottom, top or right respectively (same directions as usual).

-- Switch between autocompletion options with Tab (or Shift+Tab).
vim.api.nvim_set_keymap(
  'i',
  '<TAB>',
  [[pumvisible() ? "\<C-n>" : "\<TAB>"]],
  { noremap = true, silent = true, expr = true}
)
vim.api.nvim_set_keymap(
  'i',
  '<S-TAB>',
  [[pumvisible() ? "\<C-p>" : "\<TAB>"]],
  { noremap = true, silent = true, expr = true}
)
