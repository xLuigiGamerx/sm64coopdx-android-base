#!/bin/bash

# Fetch and update all submodules to the latest commit on their respective branches
git submodule update --remote app/jni/src

# Update only the sm64coopdx submodule
cd app/jni/src
git fetch && git merge origin/$(git symbolic-ref --short HEAD)
cd ../../..

# Commit and push the updates to the main repository
git add .
git commit -m "Updated SM64CoopDX submodule to latest commit"
git push
