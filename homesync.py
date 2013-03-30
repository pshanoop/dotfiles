#!/usr/bin/env python2

import filecmp
import os
import sys
import shutil
import json
from docopt import docopt
from jinja2 import Environment, FileSystemLoader

usage = \
"""homesync.py

Usage:
  homesync.py symlinks [--repository=<DIRECTORY>]
  homesync.py repositories
  homesync.py -h | --help
  homesync.py --version

"""

references = \
"""-----
Refs: 
  DS: Directory, symlinked
  DC: Directory, conflict
  FS: File, symlinked
  FI: File, was identical, symlinked
  FC: File, conflict
-----
"""

class SettingsLoader:

    @staticmethod
    def load(settings_filename="settings.json"):
        settings_file = open(settings_filename)
        settings = json.load(settings_file)
        settings_file.close()
        return settings


if __name__ == '__main__':
    arguments = docopt(usage, version='homesync.py 0.1')

    # TODO: handle nonexistand settings.json
    settings = SettingsLoader().load()
    symlinked_directories = settings["symlinkedDirectories"]

    repo_root = os.path.join(os.getcwd(), "common")
    if not repo_root.endswith("/"):
        repo_root = repo_root + "/"
    user_home = os.path.expanduser("~")

    if arguments["symlinks"]:
        for (dirpath, dirnames, filenames) in os.walk(repo_root):
            relative_dirpath = dirpath.replace(repo_root, "")

            home_dirpath = os.path.join(user_home, relative_dirpath)

            if relative_dirpath in symlinked_directories:
                if not os.path.exists(home_dirpath):
                    os.symlink(dirpath, home_dirpath)
                    print("DS " + relative_dirpath)
                elif not os.path.islink(home_dirpath):
                    print("DC " + relative_dirpath)
                # TODO: check if the symlink points somewhere else!
                else:
                    pass  # Everything is ok.
                del(dirnames[:])
                del(filenames[:])
            else:
                if not os.path.exists(home_dirpath):
                    os.makedirs(home_dirpath)

            for filename in filenames:
                repo_file = os.path.join(dirpath, filename)
                home_file = os.path.join(home_dirpath, filename)

                relative_filename = os.path.join(relative_dirpath, filename)

                if not os.path.exists(home_file):
                    os.symlink(repo_file, home_file)
                    print("FS " + relative_filename)
                elif not os.path.islink(home_file):
                    if filecmp.cmp(home_file, repo_file, shallow=False):
                        os.unlink(home_file)
                        os.symlink(repo_file, home_file)
                        print("FI " + relative_filename)
                    else:
                        print("FC " + relative_filename)
                # TODO: check if the symlink points somewhere else!
                else:
                    pass  # Everything is ok.

        print references
    if arguments["repositories"]:
        for repo in settings["repositories"]:
            repo_path = os.path.join(user_home, repo["localPath"])
            if not os.path.exists(repo_path):
                os.makedirs(repo_path)
                os.chdir(repo_path)
                os.system("git clone {} {}".format(repo["remotePath"], repo_path))
                print("Created: {}".format(repo_path))
            else:
                print("Existed: {}".format(repo_path))
