local M = {}

function M.breakPoint()
  local ft = vim.bo.filetype
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

  if ft == 'python' then
    vim.fn.feedkeys("oimport ipdb; ipdb.set_trace()  # fmt: skip" .. esc)
  elseif ft == 'ruby' then
    vim.fn.feedkeys("obinding.pry" .. esc)
  end
end

-- Switch from vertical split into horizontal split
vim.api.nvim_set_keymap(
  'n',
  '<Leader>i',
  ":lua require'misc'.breakPoint()<CR>",
  { noremap = true, silent = false, expr = false}
)

return M
