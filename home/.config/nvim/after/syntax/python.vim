" Turn on spell-checking. Default syntax matching checks comments too.
set spell

" Don't spell-check normal strings (only docstrings)
syn region pythonString   start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError

" Ignore `:param name:` in docstring for spell-checking.
syn region pythonDocStringParam   start=+^\s*:.*:+ end="\z1" contains=@NoSpell contained
highlight  pythonDocStringParam ctermfg=Green guifg=#99ad6a cterm=italic gui=italic

" Make python docstrings italic. Do spell-check these.
syn region pythonDocString   start=+"""+ skip=+\\"+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,pythonDocStringParam,@Spell
highlight pythonDocString ctermfg=Green guifg=#99ad6a cterm=italic gui=italic
