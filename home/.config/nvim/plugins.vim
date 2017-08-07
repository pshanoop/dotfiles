call plug#begin()

" Let Vundle manage Vundle.
Plug 'gmarik/Vundle.vim'

" Essentials.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-sensible'

" Completion.
Plug 'Valloric/YouCompleteMe', {
\  'do': 'python2 install.py --omnisharp-completer --clang-completer --system-libclang'
\}
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
Plug 'cespare/vim-toml'
Plug 'chutzpah/icalendar.vim'
Plug 'mboughaba/i3config.vim'

" UI
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dietsche/vim-lastplace'

" Misc.
Plug 'tomtom/tcomment_vim'
Plug 'justinmk/vim-sneak'

Plug 'editorconfig/editorconfig-vim'

Plug 'terryma/vim-multiple-cursors'

call plug#end()
