require('gitsigns').setup{
  signs = {
    add = {hl='GitSignsAdd', text = '▋'},
    change = {hl = 'GitSignsChange',text= '▋'},
    delete = {hl= 'GitSignsDelete', text = '▁ '},
    topdelete = {hl ='GitSignsDelete',text = '▔'},
    changedelete = {hl = 'GitSignsChange', text = '▎'},
  },
  current_line_blame = true
}

-- Make CursorHold trigger after 10ms, so blame render immediately:
vim.cmd("set updatetime=10")
