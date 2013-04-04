#!/usr/bin/env python2
#
# Copyright (c) 2013 Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

import subprocess
import filecmp
import os
import sys
import shutil
import json
from docopt import docopt
from jinja2 import Environment, FileSystemLoader

usage = \
"""\
Usage: homesync.py (symlinks | subrepos | pull | setup | add <file>...)
       homesync.py -h | --help
       homesync.py --version

symlinks          Create symlinks in your home for any missing files, and
                  show the status of any changes or conflicts.
                  The first column represents the file type: D (directory)
                  or F (regular file).
                  The second column represents the change (or status): S
                  (symlink created), I (identical file existed, replaced
                  with symlink) or C (conflict, manual intervention required).
subrepos          Initialize and update all repos defined in settings.json.
pull              Pull from all git remotes.  Will also add any missing
                  remote that is defined in settings.json.
                  TODO: update changed remotes.
add <file> ...    Add one or more files into the repository.  This will move
                  the file from your home into the repository and create a
                  symlink to it in you home.
"""

class Settings:

    def __init__(self, filename="settings.json"):
        if not os.path.exists(filename):
            print("Warning: settings.json does not exist. Using defaults.")
            self.symlinked_directories = []
            self.repositories = {}
            self.remotes = {}
        else:
            settings_file = open(filename)
            try:
                settings = json.load(settings_file)
            except ValueError as e:
                print("Error parsing settings.json as json file.")
                raise
            settings_file.close()

            self.symlinked_directories = settings["symlinkedDirectories"]
            self.repositories = settings["repositories"]
            self.remotes = settings["remotes"]

class HomeSyncException(Exception):
    pass

class Symlink:

    def __init__(self, repository, relative_path):
        self._repository = repository
        self._relative_path = relative_path
        self._symlink_path = os.path.join(os.path.expanduser("~"), relative_path)
        self._target_path = os.path.join(repository, relative_path)

    def add_to_repo(self):
        """
        Add a file present in the user's home to the repository.
        """
        if os.path.exists(self._target_path):
            raise HomeSyncException("A file already exists inside the " + \
                "repository with that same path");
        shutil.move(self._symlink_path, self._target_path)
        os.symlink(self._target_path, self._symlink_path)

        #self._update_status()

class Subrepo:

    def __init__(self, local_path, remote_path):
        self.local_path = local_path
        self.remote_path = remote_path

    def pull(self):
        if not os.path.exists(self.local_path):
            if not os.path.exists(os.path.join(self.local_path, ".git")):
                print("Not a git repository (but dir exists): {}".format(self.local_path))
            os.makedirs(self.local_path)
            os.system("git clone {} {}".format(self.local_path, self.remote_path))
            print("Created: {}".format(self.local_path))
        else:
            os.chdir(self.local_path)
            os.system("git pull origin master")
            print("Updated: {}".format(self.local_path))

if __name__ == '__main__':
    arguments = docopt(usage, version='homesync.py 0.1')

    settings = Settings()
    symlinked_directories = settings.symlinked_directories

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

    if arguments["subrepos"]:
        for repo in settings.repositories:
            local_path = os.path.join(user_home, repo["localPath"])
            remote_path = repo["remotePath"]
            Subrepo(local_path, remote_path).pull()
    if arguments["pull"]:
        proc = subprocess.Popen(["git", "remote"], stdout=subprocess.PIPE)
        remotes = proc.communicate()[0].decode()[:-1]  # Ignore the last \n
        for remote in remotes.splitlines():
            os.system("git pull -q {} master".format(remote))
    if arguments["add"]:
        for filename in arguments["<file>"]:
            if os.path.isabs(filename):
                filename = filename.replace(user_home, "")
            Symlink(repo_root, filename).add_to_repo()
    if arguments["setup"]:
        for name, location in settings.remotes.items():
            os.system("git remote add {name} {location}".format(name=name, location=location))
