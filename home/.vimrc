"
" ~/.vimrc
"

" Read the distribution's settings.
source /etc/vimrc

" Breaks vi compatibility. This needs to go before everything else.
" Also required for Vundle.
set nocompatible
" Required for Vundle.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle.
Plugin 'gmarik/Vundle.vim'

" Essentials.
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'

" Completion.
Plugin 'Rip-Rip/clang_complete'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'ervandew/supertab'

" My current theme: jellybeans
Plugin 'nanotech/jellybeans.vim'

" Syntax highlight.
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'Matt-Deacalion/vim-systemd-syntax'

" Misc.
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'

call vundle#end()

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

" Show line numbers on margin.
set number

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

" This is ignored by severl functions, including ctrlp
set wildignore+=build,node_modules,bower_components

" Toggle paste mode using F12 (does not try to indent input)
set pastetoggle=<F12>

" Autoformatters
au BufEnter,BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp map <F3> :%!astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2<CR>
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79

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

" Ignore env, the directory where virtualenv is usually set up.
set wildignore+=env

source $HOME/.completion.vimrc
