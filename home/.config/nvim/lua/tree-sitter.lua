-- Enable highlighting for all installed configs.
require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = "maintained",
    enable = true
  },
}
