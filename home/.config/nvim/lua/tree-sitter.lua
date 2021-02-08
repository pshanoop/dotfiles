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
