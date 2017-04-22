let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ },
\ 'component_expand': {
\   'syntastic': 'SyntasticStatuslineFlag',
\ },
\ 'component_type': {
\   'syntastic': 'error',
\ },
\}

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
  autocmd BufRead,BufNewFile * call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
  redraw!
endfunction
