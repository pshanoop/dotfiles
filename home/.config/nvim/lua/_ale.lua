vim.cmd('highlight ALEError guifg=White guibg=Red')
vim.cmd('highlight ALEWarning guifg=White guibg=Teal')

-- Clearing these two sets them to black, rather than the original gutter color.
-- I've copy-pasted this colour is copied over from the theme.
vim.cmd('highlight ALEErrorSign guifg=#cf6242 guibg=#333333')
vim.cmd('highlight ALEWarningSign guifg=#ffb964 guibg=#333333')

vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''

vim.g.ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'

vim.g.ale_html_beautify_options = '-s 2 -n -w 80'

-- TODO: Auto-close the loclist when it's empty.
