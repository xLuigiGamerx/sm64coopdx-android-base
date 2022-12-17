#!/bin/bash
pushd app/jni/SDL/include
#MSYS2's symlinks seem to just copy the folder which isn't really a good thing recursively. Native symlinks are broken for me so let's just use Windows's implementation
if [[ -n "$WINDIR" ]]; then
    cmd <<< "mklink /D SDL2 ."
else
    ln -s . SDL2
fi
popd
