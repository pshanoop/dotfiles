vim.g.jellybeans_use_term_italics = 1
vim.g.jellybeans_overrides = { background = { guibg= '000000' } }

vim.cmd 'colorscheme jellybeans'

-- Load highlighting from lspconfig.
-- It's not idea great, but works. I'll make something that fits better when I
-- have time for it.
require('vim.lsp.diagnostic')._define_default_signs_and_highlights()

vim.cmd('highlight ALEError guifg=White guibg=Red')
vim.cmd('highlight ALEWarning guifg=White guibg=Teal')

-- Clear signs column background (just blend into the rest):
vim.cmd('highlight clear SignColumn')
-- Set gitsigns colours:
vim.cmd('highlight GitSignsAdd guifg=#238536')
vim.cmd('highlight GitSignsChange guifg=#6A3EC1')
vim.cmd('highlight GitSignsDelete guifg=#B35A56')
vim.cmd('highlight GitSignsCurrentLineBlame guifg=#747ae3')

-- Clearing these two sets them to black, rather than the original gutter color.
-- I've copy-pasted this colour is copied over from the theme.
vim.cmd('highlight ALEErrorSign guifg=#cf6242 guibg=#333333')
vim.cmd('highlight ALEWarningSign guifg=#ffb964 guibg=#333333')


vim.cmd('highlight IndentSpace guifg=#333333')
vim.cmd('highlight IndentLine guifg=#606060')
