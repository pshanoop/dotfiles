vim.g.jellybeans_use_term_italics = 1
vim.g.jellybeans_overrides = { background = { guibg= '000000' } }

vim.cmd 'colorscheme jellybeans'

vim.cmd('highlight ALEError guifg=White guibg=Red')
vim.cmd('highlight ALEWarning guifg=White guibg=Teal')

-- Clearing these two sets them to black, rather than the original gutter color.
-- I've copy-pasted this colour is copied over from the theme.
vim.cmd('highlight ALEErrorSign guifg=#cf6242 guibg=#333333')
vim.cmd('highlight ALEWarningSign guifg=#ffb964 guibg=#333333')

vim.cmd('highlight Blamer guifg=#c06371')

vim.cmd('highlight IndentSpace guifg=#333333')
vim.cmd('highlight IndentLine guifg=#606060')
