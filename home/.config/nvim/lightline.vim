" Not using `coc_status`, since it's not really helpful.
" It just shows the current language, version, and CPU architecture.

function! CocErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif

  if get(info, 'error', 0)
    return ' ' . info['error']
  else
    return ''
  endif
endfunction

function! CocWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif

  if get(info, 'warning', 0)
    return ' ' . info['warning']
  else
    return ''
  endif
endfunction

function! CocInfos() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif

  if get(info, 'information', 0)
    return '✓ ' . info['information']
  else
    return ''
  endif
endfunction

let g:lightline = {}

let g:lightline.colorscheme = 'jellybeans'

let g:lightline.component_expand = {
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_ok': 'lightline#ale#ok',
  \ 'coc_errors': 'CocErrors',
  \ 'coc_warnings': 'CocWarnings',
  \ 'coc_infos': 'CocInfos',
\ }

let g:lightline.component_type = {
  \ 'linter_warnings': 'warning',
  \ 'linter_errors': 'error',
  \ 'linter_ok': 'left',
  \ 'coc_errors': 'error',
  \ 'coc_warnings': 'warning',
  \ 'coc_infos': 'info',
\ }

let g:lightline.component_function = {
  \ 'filetype': 'MyFiletype',
  \ 'fileformat': 'MyFileformat',
  \ 'filename': 'MyFilename',
\ }

let g:lightline.active = {
  \ 'right': [
    \ [ 'linter_errors', 'coc_errors', 'linter_warnings', 'coc_warnings', 'coc_infos', 'linter_ok', 'lineinfo' ],
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

" Trigger update when coc changes status.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Hide current mode (redundant with lightline)
set noshowmode
