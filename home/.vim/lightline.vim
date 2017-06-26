let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'right': [ [ 'neomake', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ },
\ 'component_expand': {
\     'neomake': 'LightlineNeomake',
\ },
\ 'component_type': {
\   'neomake': 'error',
\ },
\}

function LightlineNeomake()
  return '%{neomake#statusline#LoclistStatus()}'
endfunction
