"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" Brief overview of how it all works:
"
" - nvim-lspconfig sets up language servers which do a lot of heavy lifting.
"   - Lanaguge servers handle diagnostics, autoformatting, and provide
"     completion results.
"   - EFM language server uses non-LSP tools as backends, which allows
"     integrating other tools using the same interface (e.g.: black, eslint,
"     flake8, prettier, shellcheck, etc.)
" - nvim-treesitter configures tree sitters which do highlighting.
" - nvim-compe handles automplete. It uses many sources, including LSP at TS.
" - I use galaxyline to render the status line since it's super lightweight and
"   configurable in lua.
" - The status line shows LSP diagnostics (amongst other niceties).
" - The gutter refelcts git changes.
"
" TODO: Configure Leader<h> to show "Hover info", like COC did.

" Leader is recommended for user-defined bindings. See `:h leader`.
let mapleader = " "

" Plugin definitions. This also calls all the per-plugin configs.
lua require('plugins')

" Misc helpers written in Lua.
lua require('misc')

" Appearance ==================================================================

" Tell vim that the terminal supports 24-bit colours.
set termguicolors

" Show a ruler on the 80th and 120th columns.
let &colorcolumn="80,120"

" Show placeholders for these non-visible-characters.
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

" When a line doesn't fit on-screen, it's rendered wrapped, but not actually
" wrapped. This is very confusing, and reduces readability.
set nowrap

" Indentation =================================================================

" Number of spaces to use for each step of (auto)indent.
" Note that this is just the default; some filetypes have a different setting.
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-v <Tab>.
set expandtab

" Break lines longer than 79 characters.
set textwidth=79

" Navigation ==================================================================

" These are ignored when autocompleting wildcards (eg: `:open pro*`):
set wildignore+=build,env,bin,dist,*.pyc,tmp

" These get lower priority for autocomplete:
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Kitchen Sink ================================================================

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

" Colour for highlighted leading spaces and such.
highlight clear SpecialKey
highlight SpecialKey guifg='#666666'

" Use :DiffOrig to compare to saved file. Useful when recovering swap files.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" Enable mouse support (which I really only use for scrolling).
set mouse=a

" Copy to PRIMARY selection on mouse selection.
vnoremap <LeftRelease> "*ygv

" Yank to PRIMARY selection by default (PRIMARY = mouse2, CLIPBOARD = ctrl+v).
set clipboard=unnamed

" Disable arrow keys and PageDown/PageUp
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <PageDown> <nop>
nnoremap <PageUp> <nop>

au BufRead,BufNewFile *.conf set ft=dosini

au BufNewFile,BufRead [vV]agrantfile set filetype=ruby

" Smart-detect unwriteable files and handle them with SudaWrite.
let g:suda_smart_edit = 1

" Completely disable folding
set nofoldenable

" ========== Leader keybindings ===============================================

" Hide search result highlight:
map <Leader>f :nohlsearch<CR>

" Toggle paste mode using F12 (does not try to indent input)
set pastetoggle=<Leader>p

" Comment / uncomment blocks of code.
map <Leader>c :TComment<CR>

" Reload config file.
map <Leader>r :so $HOME/.config/nvim/init.vim <CR>

" Show errors and warnings.
map <Leader>e :lopen<CR>

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

" ========== Highlighting and Autocompletion ==================================

lua require('keymap')

let g:python3_host_prog = '/usr/bin/python'

" Don't spellcheck quickfix window, and use absolute line numbers on it.
autocmd FileType qf set nospell nu nornu wrap
" TODO: For the above filetype: configure Leader+e to close it.
" ========== EOF ==============================================================
