call plug#begin()

" Let Vundle manage Vundle.
Plug 'gmarik/Vundle.vim'

" Essentials.
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'

" Completion.
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py' }
Plug 'tpope/vim-endwise'
" Plug 'kana/vim-smartinput'

" My current theme: jellybeans
Plug 'nanotech/jellybeans.vim'

" Syntax highlight and file formats
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'chrisbra/csv.vim'
Plug 'cespare/vim-toml'
Plug 'chutzpah/icalendar.vim'

" UI
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" Misc.
Plug 'tpope/vim-surround'  " XXX: Haven't really been using this
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'

Plug 'editorconfig/editorconfig-vim'

Plug 'terryma/vim-multiple-cursors'

call plug#end()
