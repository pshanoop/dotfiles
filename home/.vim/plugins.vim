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

" UI
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Misc.
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
