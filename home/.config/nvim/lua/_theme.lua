vim.g.jellybeans_use_term_italics = 1
vim.g.jellybeans_overrides = { background = { guibg= '000000' } }

vim.cmd 'colorscheme jellybeans'

-- Load highlighting from lspconfig.
-- It's not idea great, but works. I'll make something that fits better when I
-- have time for it.
require('vim.lsp.diagnostic')._define_default_signs_and_highlights()

-- Clear signs column background (just blend into the rest):
vim.cmd('highlight clear SignColumn')
-- Set gitsigns colours:
vim.cmd('highlight GitSignsAdd guifg=#238536')
vim.cmd('highlight GitSignsChange guifg=#6A3EC1')
vim.cmd('highlight GitSignsDelete guifg=#B35A56')
vim.cmd('highlight GitSignsCurrentLineBlame guifg=#747ae3')

vim.cmd('highlight IndentBlanklineSpaceChar guifg=#333333')
vim.cmd('highlight IndentBlanklineChar guifg=#555555')

vim.cmd('highlight ColorColumn guibg=#121212')

-- Set INFO diagnostics to a colour that's less confusing
-- The default doesn't play well with my theme.
vim.cmd('highlight LspDiagnosticsDefaultInformation guifg=#1ABB9C')
vim.cmd('highlight link LspDiagnosticsDefaultHint LspDiagnosticsDefaultInformation')
