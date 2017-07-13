"
" ~/.vimrc
"

" Plugins!
runtime plugins.vim

" Lightline configurtion is pretty long:
runtime lightline.vim

" colorscheme
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\  'background': {
\    'ctermbg': 'none',
\    '256ctermbg': 'none',
\    'guibg': '282828'
\  },
\}
colorscheme jellybeans

" Tell vim that the terminal supports 24-bit colours.
set termguicolors

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

" Break lines longer than 79 characters.
set textwidth=79

" Show a ruler on the 80th column.
let &colorcolumn=80

" Leader is recommended for user-specifc bindings
let mapleader = ","


" Remove search highlighting by pressing ESC.
map <F2> :nohlsearch<CR>
map <Leader>f :nohlsearch<CR>

" TODO: set iskeyword so as to behave like vi

" This is ignored by several functions, including ctrlp
set wildignore+=build,env,bin,dist,*.pyc,tmp

" Use .gitignore to ignore files via ctrlp
let g:ctrlp_user_command = [
\ '.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v -P "\.jpe?g$|\.png$|\.mo$"',
\ 'find %s -type f'
\]

let g:ctrlp_prompt_mappings = {
      \ 'ToggleRegex()':   ['<c-R>'],
      \ 'PrtClearCache()': ['<c-r>'],
      \}

" These get lower priority for autocomplete:
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Toggle paste mode using F12 (does not try to indent input)
set pastetoggle=<F12>

" Autoformatters
au BufEnter,BufNewFile,BufRead *.c,*.cpp,*.h,*.hpp map <F3> :%!astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2<CR>
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79
" autocmd FileType javascript setlocal equalprg=fixjsstyle


" Comment blocks with F5.
map <F5> :TComment <CR>
map <Leader>c :TComment<CR>

" Reload (source) config file.
map <F9> :so $HOME/.vimrc <CR>

" Close location window (aka :Errors) after selecting a location.
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

" Close location (aka :Error) window.
map <F4> :lclose <CR>

" Toggle line numbers.
map <F7> :set invnumber number?<CR>

" Highlight line breaks in markdown.
hi link mkdLineBreak Underlined

" Make < > shifts keep selection.
vnoremap < <gv
vnoremap > >gv

set listchars=eol:$,tab:>-,space:·,trail:·,extends:>,precedes:<
set listchars=tab:>-,space:·,trail:·,extends:>,precedes:<
set list
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#666666'

highlight clear SpecialKey
highlight SpecialKey guifg='#666666'

" Hide current mode (redundant with airline)
set noshowmode

" Use :DiffOrig to compare to saved file. Useful when recovering swap files.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
  \ | wincmd p | diffthis

" Enable mouse support (which is really just used for scrolling).
set mouse=a

" Copy to PRIMARY selection on mouse selection.
vnoremap <LeftRelease> "*ygv

" Yank to PRIMARY selection by default.
set clipboard=unnamed

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:csv_autocmd_arrange      = 1
let g:csv_autocmd_arrange_size = 1024*1024*20

" ctrl+h: GoToDefinition
:noremap <C-h> :YcmCompleter GoToDefinition<CR>

" Auto-close the preview window after selecting a competion.
let g:ycm_autoclose_preview_window_after_completion = 1

" Don't auto-fold markdown
let g:vim_markdown_folding_disabled = 1

" Don't conceal markdown
let g:vim_markdown_conceal = 0

" Disable arrow keys (the home row is faster, but I have to force myself to get
" used to it!)
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
" Same goes for ^D and ^U
nnoremap <PageDown> <nop>
nnoremap <PageUp> <nop>

au BufRead,BufNewFile *.zsh-theme set ft=sh
au BufRead,BufNewFile *.conf set ft=dosini

au BufNewFile,BufRead [vV]agrantfile set filetype=ruby

" Remember last cursor location when re-opening a file.
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ========== Vim-specific (non-neovim) ==========

if !has('nvim')
  " Breaks vi compatibility. This needs to go before everything else.
  set nocompatible

  " Insert spaces instead of tabs.
  set smarttab

  " Highlight all search matches.
  set hlsearch

  " Required to deal with 24-bit colours
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif

" ========== Error checking (Neomake) ==========
autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_warning_sign = {'text': '!',   'texthl': 'NeomakeWarningSign'}
let g:neomake_highlight_columns = 1

highlight NeomakeErrorSign term=standout guifg=White guibg=Red ctermbg=1
highlight NeomakeError term=standout guifg=White guibg=Red ctermbg=1
highlight NeomakeWarningSign term=standout guifg=White guibg=Teal ctermbg=1
highlight NeomakeWarning term=standout guifg=White guibg=Teal ctermbg=1

map <Leader>e :lopen<CR>