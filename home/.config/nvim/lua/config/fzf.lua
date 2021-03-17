-- Properly position the fzf prompt:
vim.g.fzf_layout = { down = '40%' }
vim.g.fzf_preview_window = {}

-- TODO: Exclude current file from prompt
-- See https://github.com/junegunn/fzf.vim/issues/695

-- Ctrl-P for file navigation
-- TODO: It'd be great if matches in pwd are weighted higher.
vim.api.nvim_set_keymap(
  'n',
  '<c-p>',
  [[(len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"]],
  { noremap = true, silent = true, expr = true}
)

-- Hide ruler and line numbers and stuff from fzf window.
vim.cmd('autocmd FileType fzf set noshowmode noruler nospell nonu nornu')
