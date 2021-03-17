"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" Brief overview of how it all works:
"
" - nvim-lspconfig sets up language servers which do a lot of heavy lifting.
" - nvim-treesitter configures tree sitters which do highlighting.
" - nvim-compe handles automplete. It uses many sources, including LSP at TS.
" - ale handles diagnostics. It doesn't fully integrate with LSP yet, so
"   unifying all diagnostics is still WIP.
" - ale does the fixing (e.g.: autoreformat).
"
" TODO: Configure Leader<h> to show "Hover info", like COC did.
" TODO: Gutter icons have bad colour (ALE? LSP?)

" Plugins!
lua require('plugins')

" Lightline configurtion is pretty long:
" Lightline is the plugin that renders the colourful statusbar.
runtime lightline.vim

" Appearance ==================================================================

" Tell vim that the terminal supports 24-bit colours.
set termguicolors

" Show a ruler on the 80th and 120th columns.
let &colorcolumn="80,120"
highlight ColorColumn guibg=#121212

" Show placeholders for these non-visible-characters.
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

" When a line doesn't fit on-screen, it's rendered wrapped, but not actually
" wrapped. For code, this reduces readability. This setting disables that:
set nowrap

" Indentation =================================================================

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-v <Tab>.
set expandtab

" Break lines longer than 79 characters.
set textwidth=79

" Navigation ==================================================================

" This is ignored when autocompleting wildcards (eg: `:open pro*`):
set wildignore+=build,env,bin,dist,*.pyc,tmp

" These get lower priority for autocomplete:
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg


" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Kitchen Sink ================================================================

" Close location window (aka :Errors) after selecting a location.
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

highlight clear SpecialKey
highlight SpecialKey guifg='#666666'

" Use :DiffOrig to compare to saved file. Useful when recovering swap files.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" Enable mouse support (which is really just used for scrolling).
set mouse=a

" Copy to PRIMARY selection on mouse selection.
vnoremap <LeftRelease> "*ygv

" Yank to PRIMARY selection by default (i.e.: This is pasted with mouse2).
set clipboard=unnamed

let g:csv_autocmd_arrange      = 1
let g:csv_autocmd_arrange_size = 1024*1024*20

" Don't auto-fold markdown
let g:vim_markdown_folding_disabled = 1

" Don't conceal markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Disable arrow keys and PageDown/PageUp
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <PageDown> <nop>
nnoremap <PageUp> <nop>

au BufRead,BufNewFile *.conf set ft=dosini

au BufNewFile,BufRead [vV]agrantfile set filetype=ruby

" Make Vista wider than the default. This seems like a reasonable value.
let g:vista_sidebar_width = 50

" Smart-detect unwriteable files and handle them with SudaWrite.
let g:suda_smart_edit = 1

" ========== Leader keybindings ===============================================

" Leader is recommended for user-specifc bindings
let mapleader = " "

" Insert ipdb breakpoint
map <Leader>i oimport ipdb; ipdb.set_trace()<ESC>

" Remove search highlighting by pressing ESC.
map <Leader>f :nohlsearch<CR>

" Toggle paste mode using F12 (does not try to indent input)
set pastetoggle=<Leader>p

" Comment / uncomment blocks of code.
map <Leader>c :TComment<CR>

" Reload config file.
map <Leader>r :so $HOME/.config/nvim/init.vim <CR>

" Close location (aka :Error) window.
map <Leader>w :lclose <CR>

" Open Vista (A symbol/tag navigator)
map <Leader>v :Vista!!<CR>

" Show errors and warnings.
map <Leader>e :copen<CR>

" Lint and fix code.
map <Leader>a :ALEFix<CR>

" Jump to the next error
map <Leader>n :ALENextWrap<CR>

" Jump to definition
map <Leader>d <Plug>(coc-definition)

" Find references
map <Leader>r <Plug>(coc-references)

" Open the tree-sitter playground. Used for debugging its queries.
map <Leader>t :TSPlaygroundToggle<CR>

function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif

endfunction
nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

" XXX: Add git root name here?
" use  system('git rev-parse --show-toplevel 2> /dev/null') and some awk
nnoremap <Leader>. :echo @%<CR>

" This only works on the current directory, and not the entire project.
" TODO: Ideally, I'd want this to be the git-directory to the current file.
" TODO: Should also show git-untracked files.
map <Leader>p :Files<CR>

" ========== Diagnostics (errors and linting) =================================
" ALE does a lot of diagnostics.
" LSPs do the rest. They don't [yet] fully match in style. Ideally, one should
" feed the other so that a single error list can be maintained, etc.

" TODO: configure LSP highlighting!

" ========== Highlighting and Autocompletion ==================================

lua require('keymap')

let g:python3_host_prog = '/usr/bin/python'

" Switch between options with Tab (or Shift+Tab)
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Don't spellcheck quickfix window, and use absolute line numbers on it.
autocmd FileType qf set nospell nu nornu wrap
" TODO: For the above filetype: configure Leader+e to close it.
" ========== EOF ==============================================================
