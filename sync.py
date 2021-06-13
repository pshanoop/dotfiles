#!/usr/bin/env python

"""Sync symlinks to dotfiles repo.

This script creates symlinks in $HOME pointing to the right files inside this
repository.

Regular files are symlinked directly.

For some cases, I want to git-track an entire directory. For example, vim's
configuration directory (which contains a bunch of scripts). These directories
are enumerated in `linked_dirs`.
"""
import os
from pathlib import Path

from colorama import Fore
from colorama import init

init(autoreset=True)
os.chdir(Path(__file__).parent / "home")

# List of directories that we don't traverse and symlink each file.
# Instead we symlink the directory itself.
# This can't be a generator since we'd exhaust it on the first iteration.
linked_dirs = {
    Path(dir)
    for dir in [
        ".config",
        ".local/bin",
        ".local/lib",
        ".local/share/applications",
        ".local/share/dark-mode.d",
        ".local/share/flatpak/overrides",
        ".local/share/light-mode.d",
        ".local/share/nemo",
        ".mozilla/firefox/default/chrome",
    ]
}

# XXX: hardlink support?


def all_paths():
    """Return all paths that should be symlinked."""

    for dir in linked_dirs:
        yield dir
    for file in Path(".").rglob("*"):
        if file.is_dir():
            continue
        if any(file.is_relative_to(dir) for dir in linked_dirs):
            continue
        yield file


for path in all_paths():
    repo_path = path.absolute()
    home_path = Path.home() / path

    if home_path.is_symlink() and home_path.resolve() == repo_path:
        print(path, Fore.MAGENTA + "Is linked")
    elif home_path.exists() or home_path.is_symlink():
        print(path, Fore.RED + "Conflict")
    else:
        home_path.parent.mkdir(mode=0o755, parents=True, exist_ok=True)
        home_path.symlink_to(repo_path)
        print(path, Fore.GREEN + "Linked!")
