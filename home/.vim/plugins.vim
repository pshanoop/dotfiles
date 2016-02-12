set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle.
Plugin 'gmarik/Vundle.vim'

" Essentials.
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'

" Completion.
" This following is installed via Arch's package manager, since manual
" installation (or via Vundle) is a bit of a pain:
" Plugin 'Valloric/YouCompleteMe'

" My current theme: jellybeans
Plugin 'nanotech/jellybeans.vim'

" Syntax highlight and file formats
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'rust-lang/rust.vim'
Plugin 'chrisbra/csv.vim'

" UI
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

" Misc.
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
