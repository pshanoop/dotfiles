let b:ale_fixers = ['rustfmt']
" Running rustfmt doens't pick up the edition by itself. It suggests editing
" Cargo.toml, but doesn't seem to be reading it properly.
let b:ale_rust_rustfmt_options = '--edition 2018'
let b:ale_fix_on_save = 1

setlocal shiftwidth=4
setlocal tabstop=4
