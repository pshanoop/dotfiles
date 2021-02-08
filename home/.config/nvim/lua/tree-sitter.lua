-- Enable highlighting for all installed configs.
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  -- Playground is basically an inspector.
  playground = {
    enable = true,
  },
}

-- Use folding from treesitter.
--
-- I don't _really_ use folding, but since I contributed the Vue treesitter
-- configs, I had to set it up, and it's worth leaving since I'm curious to
-- find uses fold folding.
vim.cmd("set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")
-- Open files unfolded. See https://stackoverflow.com/a/23672376
vim.cmd("autocmd BufWinEnter * silent! :%foldopen!")
