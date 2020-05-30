"
" ~/.vimrc
"

" Plugins!
runtime plugins.vim

" Lightline configurtion is pretty long:
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

set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#333333'

" Show line number for the current line...
set number
" ... and relative line numbers for the rest.
set relativenumber

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

function! FindGitRoot()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

nnoremap <silent> <C-p> :execute 'Files ' . FindGitRoot()<CR>
cnoreabbrev rg Rg
" FIXME: Why does the results window clocse when I pick one?
"        Can I somehow get it back?

" TODO: Exclude current file from prompt
" (Maybe work using this as a base: https://github.com/junegunn/fzf.vim/pull/422/files )
" TODO: Refresh with c-R? (Might not be necesary since there's less caching)
" TODO: Some way of switching to regex?
"       I never really used that, so figure out if I really need that/

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

" Yank to PRIMARY selection by default.
set clipboard=unnamed

" Allow saving of files as sudo when I forgot to start vim using sudo.
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

au BufRead,BufNewFile *.zsh-theme set ft=sh
au BufRead,BufNewFile *.conf set ft=dosini

au BufNewFile,BufRead [vV]agrantfile set filetype=ruby

" Make Vista wider than the default. This seems like a reasonable value.
let g:vista_sidebar_width = 50

" Remember last cursor location when re-opening a file.
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

nnoremap <silent> <leader> :WhichKey ','<CR>

" Jedi misbehaves and highjacks <Leader>n out of the box.
let g:jedi#usages_command = ""

" ========== Error checking (ALE) =============================================

highlight ALEError guifg=White guibg=Red
highlight ALEWarning guifg=White guibg=Teal

" Clearing these sets them to black, rather than the original gutter color.
" This colour is copied over from the theme.
" Using `hi link ALEWarningSign SignColumn` sets the fg to something
" undesireable.
highlight ALEErrorSign guifg=White guibg=#333333
highlight ALEWarningSign guifg=White guibg=#333333

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠ '

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Use quickfix list (rather than loclist).
let g:ale_set_quickfix = 1

" Keep the quickfix list open when navigating.
let g:ale_keep_list_window_open = 1

" Previous C settings where `astyle -A2 -s4 -S -N -Y -p -U -H -k3 -xj -xy -z2`
" TODO: delete backets around oneline IFs
" TODO: fix \n being added before EOF indefinitely
" -xC79

" ========== Autocompletion (deoplete) ========================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

let g:python3_host_prog = '/usr/bin/python'

" Don't use jedi's autocompletion (we use it for gotodefinition)
let g:jedi#completions_enabled = 0

" Switch between options with Tab (or Shift+Tab)
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

" Close preview window on leaving the insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Autocomplete emoji for these filetypes
call deoplete#custom#source('emoji', 'filetypes', [])
" Actually convert text into emojis:
call deoplete#custom#source('emoji', 'converters', ['converter_emoji'])

let g:ale_html_beautify_options = '-s 2 -n -w 80'

""""" End autocompletion
