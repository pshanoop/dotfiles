local nvim_lsp = require('lspconfig')

nvim_lsp.jedi_language_server.setup{}
nvim_lsp.rust_analyzer.setup{}
nvim_lsp.tsserver.setup{}
