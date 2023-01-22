#!/usr/bin/env python3
from git.repo import Repo

repo = Repo('~/.config/task/data')
origin = repo.remote()
origin.pull()
