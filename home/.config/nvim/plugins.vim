call plug#begin()

" Let Vundle manage Vundle.
Plug 'gmarik/Vundle.vim'

" Core ========================================================================
Plug 'ctrlpvim/ctrlp.vim'
Plug 'liuchengxu/vim-which-key'

" Syntax checking and linting.
Plug 'dense-analysis/ale'

" A few miscelaneous settings that just make sense.
Plug 'tpope/vim-sensible'

" Used for searching -- still experimenting with it.
" FIXME: Why does the window close when I follow a result?
Plug 'mileszs/ack.vim'

" Completion.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'fszymanski/deoplete-emoji'

" Ands end line in bash/ruby and similar languages.
Plug 'tpope/vim-endwise'

" Easy tabulation with :Tab
Plug 'godlygeek/tabular'

" My current theme: jellybeans
Plug 'nanotech/jellybeans.vim'

" Used together with :w!! to save files with sudo.
Plug 'lambdalisue/suda.vim'

" Language-specific ===========================================================
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'chutzpah/icalendar.vim'
Plug 'mboughaba/i3config.vim'
Plug 'leafgarland/typescript-vim'

" Extra python support
Plug 'davidhalter/jedi-vim'

" UI ==========================================================================
" Show thin vertical lines on each indentation level:
Plug 'Yggdroot/indentLine'
" The above doesn't draw anything on empty lines. This does:
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'airblade/vim-gitgutter'
Plug 'dietsche/vim-lastplace'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'

" Shortcuts ===================================================================
Plug 'tomtom/tcomment_vim'

" Interoperability ============================================================
Plug 'editorconfig/editorconfig-vim'

call plug#end()
