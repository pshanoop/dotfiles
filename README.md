dotfile-vim
===========

This repository contains vim-specific dotfiles. They can easily be managed via
homesick by running:

    homesick clone git@gitlab.com:hobarrera/dotfiles-vim.git
    homesick link

You should also run `:VundleInstall` to install all vim plugins.

Some additional utilities are required in your `$PATH`:

 * flake8 (python)
 * go, gofmt (golang)
 * gjslint (javascript)

And probably a few more which I can't recall right now.
