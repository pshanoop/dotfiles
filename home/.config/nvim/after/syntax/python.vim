" Make python docstrings italic
syn region pythonDocstring matchgroup=pythonTripleQuotes start=+[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="\z1" keepend contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
highlight pythonDocstring ctermfg=Green guifg=#99ad6a cterm=italic gui=italic
