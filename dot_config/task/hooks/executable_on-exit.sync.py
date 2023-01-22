#!/usr/bin/env python3
from git.repo import Repo

repo = Repo('~/.config/task/data')

if repo.is_dirty():
    index = repo.index 
    [index.add(modified.a_path) for modified in index.diff(None)]
    index.commit('Updating tasks')
    if(len(list(repo.iter_commits('master@{u}..master'))) > 10):
        origin = repo.remote()
        origin.push()
