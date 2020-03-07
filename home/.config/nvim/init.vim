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
\    'guibg': '000000'
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
let &colorcolumn="80,120"
highlight ColorColumn ctermbg=darkgrey guibg=#242424

" Leader is recommended for user-specifc bindings
let mapleader = ","

" Insert ipdb breakpoint with Leader+i
map <Leader>i oimport ipdb; ipdb.set_trace()<ESC>

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

map <Leader>t :TagbarToggle<CR>

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

" ========== Error checking (ALE) ==========

highlight ALEErrorSign term=standout guifg=White guibg=Red ctermbg=1
highlight ALEError term=standout guifg=White guibg=Red ctermbg=1
highlight ALEWarningSign term=standout guifg=White guibg=Teal ctermbg=1
highlight ALEWarning term=standout guifg=White guibg=Teal ctermbg=1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'

" Show errors and warnings.
map <Leader>e :copen<CR>

" Lint and fix code.
map <Leader>a :ALEFix<CR>

" Use quickfix list (rather than loclist).
let g:ale_set_quickfix = 1

" Keep the quickfix list open when navigating.
let g:ale_keep_list_window_open = 1

" Previous C settings where `astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2`
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79

""""" Autocompletion (deoplete)
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

" Don't use jedi's autocompletion (we use it for gotodefinition)
let g:jedi#completions_enabled = 0

" Switch between options with Tab (or Shift+Tab)
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Close preview window on leaving the insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Autocomplete emoji for RST (markdown and git-commit are defaults)
call deoplete#custom#source('emoji', 'filetypes', ['rst'])

" " Use ALE and also some plugin 'foobar' as completion sources for all code.
" call deoplete#custom#option('sources', {
" \ '_': ['ale', 'foobar'],
" \})

let g:ale_html_beautify_options = '-s 2 -n -w 80'

""""" End autocompletion

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
