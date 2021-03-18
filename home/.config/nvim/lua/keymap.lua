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
