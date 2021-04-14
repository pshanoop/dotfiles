"""Sync symlinks to dotfiles repo.

This script creates symlinks in $HOME pointing to the right files inside this
repository.

Regular files are symlinked directly.

For some cases, I want to git-track an entire directory. For example, vim's
configuration directory (which contains a bunch of scripts). These directories
are enumerated in `linked_dirs`.
"""
import os
from itertools import chain
from pathlib import Path

from colorama import Fore
from colorama import init

init(autoreset=True)
os.chdir(Path(__file__).parent / "home")

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
    ]
}

# XXX: hardlink support?

all_files = (
    file
    for file in Path(".").rglob("*")
    if not (file.is_dir() or any(file.is_relative_to(dir) for dir in linked_dirs))
)

all_paths = chain(linked_dirs, all_files)


home = Path.home()
for path in all_paths:
    repo_path = path.absolute()
    home_path = home / path
    resolved_path = home_path.resolve()

    if home_path.is_symlink() and resolved_path == repo_path:
        print(path, Fore.MAGENTA + "Is linked")
    elif home_path.exists() or home_path.is_symlink():
        print(path, Fore.RED + "Conflict")
    else:
        home_path.symlink_to(repo_path)
        print(path, Fore.GREEN + "Linked!")
