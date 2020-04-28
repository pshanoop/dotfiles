" Turn on spell-checking. Default syntax matching checks comments too.
set spell

" Don't spell-check normal strings (only docstrings)
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape

" Make python docstrings italic. Do spell-check these.
syn region  pythonDocstring matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
highlight pythonDocstring ctermfg=Green guifg=#99ad6a cterm=italic gui=italic
