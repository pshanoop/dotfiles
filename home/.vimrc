"
" ~/.vimrc
"

" Breaks vi compatibility. This needs to go before everything else.
" Also required for Vundle.
set nocompatible
" Required for Vundle.
filetype off

" Plugins!
source ~/.vim/plugins.vim

filetype plugin indent on

" colorscheme sand
colorscheme jellybeans

" Tell vim that the terminal supports 256 colours.
:set t_Co=256

" Enable lexical highlighting.
syntax enable

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" Insert spaces instead of tabs.
set smarttab

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

" Copy indentation over to new lines.
set autoindent

" Break lines longer than 79 characters.
set textwidth=79

" Show the line and column number of the cursor position.
set ruler

" Highlight all search matches.
set hlsearch

" Remove search highlighting by pressing ESC.
map <F2> :nohlsearch<CR>

" Highlight search results on-the-fly.
set incsearch

" TODO: set iskeyword so as to behave like vi

" This is ignored by several functions, including ctrlp
set wildignore+=build,env,bin,dist,*.pyc,tmp

" Use .gitignore to ignore files via ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" These get lower priority for autocomplete:
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Toggle paste mode using F12 (does not try to indent input)
set pastetoggle=<F12>

" Autoformatters
au BufEnter,BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp map <F3> :%!astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2<CR>
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79
" autocmd FileType javascript setlocal equalprg=fixjsstyle


" Comment blocks with F5.
map <F5> :TComment <CR>

" Reload (source) config file.
map <F9> :so $HOME/.vimrc <CR>

" Use C++11.
let g:syntastic_cpp_compiler_options = '-std=c++11'

" Verify C++ header files as well.
let g:syntastic_cpp_check_header = 1

" Reload header files on every rerun.
let g:syntastic_cpp_auto_refresh_includes = 1

" Include header files from these locations.
let g:syntastic_cpp_include_dirs = ["/usr/include/qt/QtWidgets/"]

" Check files on open.
let g:syntastic_check_on_open = 1

" Use flake8 for python files (which also checks pep8).
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_go_checkers = ['go', 'gofmt']

let g:syntastic_javascript_checkers = ['gjslint']

let g:syntastic_javascript_gjslint_args = '--nojsdoc'

" Set syntastic errors to red.
:highlight SyntasticError term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
:highlight SyntasticErrorSign term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
:highlight clear SignColumn

" Close location window (aka :Errors) after selecting a location.
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

" Close location (aka :Error) window.
map <F4> :lclose <CR>

" Toggle line numbers.
map <F7> :set invnumber number?<CR>

" Highlight line breaks in markdown.
hi link mkdLineBreak Underlined

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" Allow backspacing over line jumps, indent and over the start of an insert.
set backspace=indent,eol,start

set listchars=eol:$,tab:>-,space:·,trail:·,extends:>,precedes:<
set listchars=tab:>-,space:·,trail:·,extends:>,precedes:<
set list
let g:indentLine_char = '│'
let g:indentLine_color_term = 0

highlight clear SpecialKey
highlight link SpecialKey Conceal

" Shows airline all the time:
set laststatus=2
" Hide current mode (redundant with airline)
set noshowmode

" Use :DiffOrig to compare to saved file. Useful when recovering swap files.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" Enable mouse support (which is really just used for scrolling).
set mouse=a

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:csv_autocmd_arrange      = 1
let g:csv_autocmd_arrange_size = 1024*1024*20
