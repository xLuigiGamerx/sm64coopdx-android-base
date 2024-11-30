#!/bin/bash

# Fetch and update all submodules to the latest commit on their respective branches
git submodule update --remote app/jni/src

# Iterate over each submodule and ensure it's on the correct branch
git submodule foreach 'git fetch && git merge origin/$(git symbolic-ref --short HEAD)'

# Commit and push the updates to the main repository
git add .
git commit -m "Updated SM64CoopDX submodule to latest commit"
git push
