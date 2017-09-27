let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'right': [ [ 'neomake', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ },
\ 'component_expand': {
\     'neomake': 'LightlineNeomake',
\ },
\ 'component_function': {
\   'filetype': 'MyFiletype',
\   'fileformat': 'MyFileformat',
\   'filename': 'MyFilename',
\ },
\ 'component_type': {
\   'neomake': 'error',
\ },
\}

function LightlineNeomake()
  return '%{neomake#statusline#LoclistStatus()}'
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFilename()
  return expand('%:t') !=# '' ? '' . WebDevIconsGetFileTypeSymbol() . '' . expand('%:t') : '[No Name]'
endfunction
