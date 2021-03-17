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

-- Use quickfix list (rather than loclist).
-- TODO: It might make sense to use the location-list, which is per-file:
-- https://stackoverflow.com/questions/20933836/what-is-the-difference-between-location-list-and-quickfix-list-in-vim
vim.g.ale_set_quickfix = 1

-- Keep the quickfix list open when navigating.
vim.g.ale_keep_list_window_open = 1
