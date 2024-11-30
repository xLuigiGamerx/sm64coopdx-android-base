#!/bin/bash

# Fetch and update all submodules to the latest commit on their respective branches
git submodule update --remote app/jni/src

# Ensure it's on the correct CoopDX branch
cd app/jni/src
git pull
cd ../../..

# Commit and push the updates to the main repository
git add .
git commit -m "Updated SM64CoopDX submodule to latest commit"
git push
