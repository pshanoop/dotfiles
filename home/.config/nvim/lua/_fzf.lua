local M = {}

-- Properly position the fzf prompt:
vim.g.fzf_layout = { down = '40%' }

-- TODO: Exclude current file from prompt
-- See https://github.com/junegunn/fzf.vim/issues/695

function M.show_fuzzy_finder()
  local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null", "r")
  local git_root = handle:read()

  local source, prompt, root
  if git_root then
    source = 'git ls-files --cached --modified --others --exclude-standard | uniq'
    prompt = 'git> '
    root = git_root
  else
    -- Sorting makes this super slow, since all input must be ready before the
    -- first render.
    source = 'ag -g "" --hidden'
    prompt = 'pwd> '
    root = vim.fn.getcwd()
  end

  -- TODO: If the current file is unsaved, open it in a new split.
  -- Can I do this intelligently based on the size of the current one?

  local cmd = string.format(
    ":call fzf#run(fzf#wrap({'source': '%s', 'options': ['--prompt', '%s'], 'dir': '%s'}))",
    source,
    prompt,
    root
  )
  vim.cmd(cmd)
end

-- Ctrl-P / Leader-P for file navigation
--
-- For legacy reasons, both stay around, though the now do the same thing (and
-- are very smart about it).
--
-- If in a git repo, shows a file-picker for all non-ignored files. Untracked
-- failes are included too. If outside a git repo, just all files. Dotfiles are
-- always included.
--
-- TODO: It'd be great if matches in pwd are weighted higher.
vim.api.nvim_set_keymap(
  'n',
  '<c-p>',
  [[:lua require('_fzf').show_fuzzy_finder()<cr>]],
  { noremap = true, silent = true, expr = false}
)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>p',
  [[:lua require('_fzf').show_fuzzy_finder()<cr>]],
  { noremap = true, silent = true, expr = false}
)

-- Hide ruler and line numbers and stuff from fzf window.
vim.cmd('autocmd FileType fzf set noshowmode noruler nospell nonu nornu')

return M
