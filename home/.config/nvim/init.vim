"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
" Brief overview of how it all works:
"
" - coc.nvim is the main plugin for linting, autocompletion, and diagnostics.
" - ALE does some linting too, but coc grabs its output and shows it all together.
" - ALE does the fixing (e.g.: autoreformat).
" - coc.nvim renders signatures/docs in some contextual situations.

let g:polyglot_disabled = ['vue', 'scss']

" Plugins!
runtime plugins.vim

" Lightline configurtion is pretty long:
" Lightline is the plugin that renders the colourful statusbar.
runtime lightline.vim

" Appearance ==================================================================

" colorscheme
let g:jellybeans_use_term_italics = 1
let g:jellybeans_overrides = {
\  'background': {
\    'guibg': '000000'
\  },
\}
colorscheme jellybeans

" Tell vim that the terminal supports 24-bit colours.
set termguicolors

" Show a ruler on the 80th column.
let &colorcolumn="80,120"
highlight ColorColumn guibg=#121212

" Show placeholders for these non-visible-characters.
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
" And also indentation lines.
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#333333'

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

" Show git-blame at the end of the current:
let g:blamer_delay = 0
let g:blamer_enabled = 1
let g:blamer_date_format = '%Y-%m-%d'

" When a line doesn't fit on-screen, it's rendered wrapped, but not actually
" wrapped. For code, this reduces readability. This setting disables that:
set nowrap

" Indentation =================================================================

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" To insert a real tab when 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" Break lines longer than 79 characters.
set textwidth=79

" Navigation ==================================================================

" This is ignored when autocompleting wildcards (eg: `:open pro*`):
set wildignore+=build,env,bin,dist,*.pyc,tmp

" These get lower priority for autocomplete:
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg

" Ctrl-P for file navigation
" TODO: It'd be great if matches in pwd are weighted higher.
nnoremap <silent> <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
autocmd FileType fzf set noshowmode noruler nospell nonu nornu

" Properly position the fzf prompt (broken upstream via c60ed17)
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

" :Ag does what one would expect out of the box.
" The colorscheme is somehow broken (it's neither Vim's not Ag's).

" TODO: Exclude current file from prompt
" https://github.com/junegunn/fzf.vim/issues/695

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

" Re-enable swap files.
" vim-polyglot has some feature creep that changes the default. This brings in
" a few, highly-breaking bugs:
set swapfile

" Enable mouse support (which is really just used for scrolling).
set mouse=a

" Copy to PRIMARY selection on mouse selection.
vnoremap <LeftRelease> "*ygv

" Yank to PRIMARY selection by default (i.e.: This is pasted with mouse2).
set clipboard=unnamed

" Allow saving of files via sudo.
cmap w!! w suda://%

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
" XXX: Given that COC is a superset of these, probably best to use that.
map <Leader>n :ALENextWrap<CR>

" Jump to definition
map <Leader>d <Plug>(coc-definition)

" Find references
map <Leader>r <Plug>(coc-references)

function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>

nnoremap <Leader>k :call <SID>show_documentation()<CR>

" Jedi misbehaves and highjacks <Leader>n out of the box.
let g:jedi#usages_command = ""

" ========== Error checking (ALE) =============================================
" Apparently, coc can handle ale diagnostics. Maybe simplify doing that.
" See https://github.com/neoclide/coc.nvim/issues/348#issuecomment-454775970

highlight ALEError guifg=White guibg=Red
highlight ALEWarning guifg=White guibg=Teal

" Clearing these sets them to black, rather than the original gutter color.
" This colour is copied over from the theme.
" Using `hi link ALEWarningSign SignColumn` sets the fg to something
" undesireable.
highlight ALEErrorSign guifg=#cf6242 guibg=#333333
highlight ALEWarningSign guifg=#ffb964 guibg=#333333

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Use quickfix list (rather than loclist).
let g:ale_set_quickfix = 1
" This might not be best: https://stackoverflow.com/questions/20933836/what-is-the-difference-between-location-list-and-quickfix-list-in-vim

" Keep the quickfix list open when navigating.
let g:ale_keep_list_window_open = 1

" Previous C settings where `astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2`
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79

let g:ale_html_beautify_options = '-s 2 -n -w 80'

" ========== Autocompletion ===================================================

let g:python3_host_prog = '/usr/bin/python'

" COC has unusual integration into Vim:
" - It handles its own config file, `coc-settings.json`.
" - It handles its own subpackages, via `~/.config/coc/extensions/package.json`.
"
" When reinstalling, keep in mind that these packages must be reinstalled as an
" extra step.

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Hack required for coc-emoji to work.
" See https://github.com/neoclide/coc-sources/issues/15
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" There's more features that I might want to use, but since I'm only using
" flake8/black right now, there's nothing to power them.
" Check them out when I'm working on some non-python project.
" See https://github.com/neoclide/coc.nvim

highlight CocErrorSign guifg=#cf6242 guibg=#333333
highlight CocWarningSign guifg=#ffb964 guibg=#333333

" Switch between options with Tab (or Shift+Tab)
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Close preview window on leaving the insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" ========== EOF ==============================================================
