-- Modularising this code is hard. Should ALE-specific settings be in this
-- file, or in the theme's config file? It's in the theme. Otherwise the theme
-- would overwrite it.

vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''

vim.g.ale_echo_msg_format = '[%linter%] %code%: %s [%severity%]'

vim.g.ale_html_beautify_options = '-s 2 -n -w 80'

-- TODO: Auto-close the loclist when it's empty.
