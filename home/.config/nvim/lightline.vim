let g:lightline = {}

let g:lightline.colorscheme = 'jellybeans'

let g:lightline.component_expand = {
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error',
  \ 'linter_ok': 'left',
\ }

let g:lightline.component_function = {
  \ 'filetype': 'MyFiletype',
  \ 'fileformat': 'MyFileformat',
  \ 'filename': 'MyFilename',
\ }

let g:lightline.active = {
  \ 'right': [
    \ [ 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo' ],
    \ ['percent'],
    \ [ 'fileformat', 'fileencoding', 'filetype' ]
  \ ]
\ }

let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFilename()
  return expand('%:t') !=# '' ? '' . WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[No Name]'
endfunction

" Hide current mode (redundant with lightline)
set noshowmode
