" Turn on spell-checking. Default syntax matching checks comments too.
set spell

" Don't spell-check normal strings (only docstrings)
syn region  pythonString matchgroup=pythonQuotes
      \ start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1"
      \ contains=pythonEscape

" Ignore paramteres in docstring for spell-checking.
syn region pythonDocstringParam
      \ start=+^\s*:.*:+ end="\z1" contains=@NoSpell contained
highlight  pythonDocstringParam ctermfg=Green guifg=#99ad6a cterm=italic gui=italic

" Make python docstrings italic. Do spell-check these.
syn region  pythonDocstring matchgroup=pythonTripleQuotes
      \ start=+[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="\z1" keepend
      \ contains=pythonEscape,pythonSpaceError,pythonDoctest,pythonDocstringParam,@Spell
highlight pythonDocstring ctermfg=Green guifg=#99ad6a cterm=italic gui=italic
