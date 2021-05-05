" Lightline configuration
"
" Lightline needs functions it uses to be defined as Vim functions.
" However, most of the configuration itself is defined via Lua code (much
" easier on the eyes), so see lightline.lua for details.

function! LspErrors() abort
  return luaeval("require('lightline').getDiagnostics('errors')")
endfunction

function! LspWarnings() abort
  return luaeval("require('lightline').getDiagnostics('warnings')")
endfunction

function! LspHints() abort
  return luaeval("require('lightline').getDiagnostics('hints')")
endfunction

function! LspInfos() abort
  return luaeval("require('lightline').getDiagnostics('info')")
endfunction

function! LspStatus() abort
  return luaeval("require('lightline').getStatus()")
endfunction

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
