call plug#begin()

" Let Vundle manage Vundle.
Plug 'gmarik/Vundle.vim'

" Core ========================================================================
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'

" Syntax checking and linting.
Plug 'dense-analysis/ale'

" A few miscelaneous settings that just make sense.
Plug 'tpope/vim-sensible'

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
Plug 'sheerun/vim-polyglot'
Plug 'digitaltoad/vim-jade'

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
Plug 'liuchengxu/vista.vim'

" Shortcuts ===================================================================
Plug 'tomtom/tcomment_vim'

" Interoperability ============================================================
Plug 'editorconfig/editorconfig-vim'

call plug#end()
