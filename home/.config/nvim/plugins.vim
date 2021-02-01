call plug#begin()

" Let Vundle manage Vundle.
Plug 'gmarik/Vundle.vim'

" Core ========================================================================
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Syntax checking and linting.
Plug 'dense-analysis/ale'

" A few miscelaneous settings that just make sense.
Plug 'tpope/vim-sensible'

" Completion.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Easy tabulation with :Tab
Plug 'godlygeek/tabular'

" My current theme: jellybeans
Plug 'nanotech/jellybeans.vim'

" Used together with :w!! to save files with sudo.
Plug 'lambdalisue/suda.vim'

" Language-specific ===========================================================

" These are just highlighting:
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-jade'
Plug 'neoclide/jsonc.vim'

" Highlighting and some other features. Not sure I'm actually using those.
Plug 'rust-lang/rust.vim'

" Highlighting, autocompletion and other LSP features:
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

" Very sophisticated and efficient highlighting for lots of languages:
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" UI ==========================================================================
" Show thin vertical lines on each indentation level:
Plug 'Yggdroot/indentLine'
" The above doesn't draw anything on empty lines. This does:
Plug 'lukas-reineke/indent-blankline.nvim'

" Show git blame at the end of lines.
Plug 'APZelos/blamer.nvim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'airblade/vim-gitgutter'
Plug 'dietsche/vim-lastplace'
Plug 'ryanoasis/vim-devicons'

" Sidebar with symbols, tags, etc.
Plug 'liuchengxu/vista.vim'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Distraction-free writing.
Plug 'junegunn/goyo.vim'

" Shortcuts ===================================================================
Plug 'tomtom/tcomment_vim'

" Interoperability ============================================================
Plug 'editorconfig/editorconfig-vim'

call plug#end()
