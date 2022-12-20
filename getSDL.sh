#!/bin/bash
pushd app/jni/SDL/include
#Symlinks basically just do not work on Windows, so copy all the files instead
if [[ -n "$WINDIR" ]]; then
    mkdir SDL2
    cp *.h SDL2
else
    ln -s . SDL2
fi
popd
