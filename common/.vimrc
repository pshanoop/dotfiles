"
" ~/.vimrc
"
" Last reviewed 2014-07-24

source /etc/vimrc

" Breaks vi compatibility. This needs to go before everything else.
set nocompatible

filetype plugin indent on

colorscheme sand

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
"nmap <silent> <ESC> :nohlsearch<CR>

" Highlight search results on-the-fly.
set incsearch

" TODO: set iskeyword so as to behave like vi
