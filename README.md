# `sm64ex-coop` Android Port
This is a port of the [`sm64ex-coop` multiplayer mod for Super Mario 64](https://github.com/djoslin0/sm64ex-coop) to Android using SDL2 with OpenGL ES 2.0.

# Build Instructions

## Android

To compile only `libmain.so` (the minimum required) and use precompiled `libSDL2.so`, `classes.dex`, `.xml` files, and `resources.arsc`, follow instructions [here](https://github.com/robertkirkman/sm64ex-coop/blob/android/README_android.md)!

To compile fully, including Java and SDL2 components, follow the instructions in the above link up to and including step 22, then do the following:

## Windows

1. Go to the [MSYS2 Releases page](https://github.com/msys2/msys2-installer/releases), click "Assets" under the newest release, and click the link that looks like "`msys2-x86_64-XXXXXXXX.exe`":

![image](https://user-images.githubusercontent.com/31490854/208398261-b2ca155a-750c-4739-a5e0-17439e501f4d.png)

2. Click the file in your browser's downloads popup when it finishes downloading:

![image](https://user-images.githubusercontent.com/31490854/208398666-a26fdc24-e9ff-4667-896f-3d6280f3cf34.png)

3. Click "More info" in the Windows Defender SmartScreen popup, then click "Run anyway":

![image](https://user-images.githubusercontent.com/31490854/208399483-bda4a582-34f5-4748-850a-7bb34a8d0a2a.png)

![image](https://user-images.githubusercontent.com/31490854/208399904-ea2a2114-f49e-4a7f-ab80-e11fb8f9bf00.png)

4. Click "Next" twice in the MSYS2 installer, then click "Install", wait for the installation to complete, then click "Next", then uncheck "Run MSYS2 Now", then click "Finish":

![image](https://user-images.githubusercontent.com/31490854/208400421-321b0275-ed76-4545-a439-c313b6ed64bf.png)

![image](https://user-images.githubusercontent.com/31490854/208401958-9c6b0c02-df5f-4d10-8f75-6a3e64af2620.png)

5. Open the Start Menu and search "MSYS2 MINGW64", then click on it. This is the MSYS2 with the BLUE icon.

![image](https://user-images.githubusercontent.com/31490854/208402353-af6f7236-5912-4356-849c-cee7d64b406f.png)

6. Run the following command in the MSYS2 window. You can use the button in the right side of the code block to copy it from GitHub, then right click in the MSYS2 window and click "Paste" to paste it, then press Enter to run it:
```sh
pacman -Syuu --noconfirm
```

![image](https://user-images.githubusercontent.com/31490854/208403908-5d799f25-410c-45b9-895a-293c7cbedcc3.png)

7. If the MSYS2 window closes, **repeat steps 5 and 6 until it no longer closes**. Then, run this command in the MSYS2 window to install native build dependencies:
```sh
pacman -S --noconfirm unzip make git mingw-w64-x86_64-gcc python3
```

8. Next, run these commands to clone the repository and navigate to the `sm64ex-coop-android-base/app/jni/src` directory:
```sh
git clone --recursive https://github.com/robertkirkman/sm64ex-coop-android-base.git
cd sm64ex-coop-android-base/app/jni/src
```

9. Leave the MSYS2 window open for now and open a File Explorer window, then click "This PC" in the left column:

![image](https://user-images.githubusercontent.com/31490854/208407165-2042385b-6690-4e33-9728-d0d960e6c1b7.png)

![image](https://user-images.githubusercontent.com/31490854/208407299-cd79817b-e87a-4780-960f-a8353c9cd759.png)

10. Open drive `C:` and navigate to `C:\msys64\home\[your username]\sm64ex-coop-android-base\app\jni\src`, where "`[your username]`" is your Windows username:

![image](https://user-images.githubusercontent.com/31490854/208407679-c8b338f6-f6c8-4e9a-a87e-805ed85973fb.png)

![image](https://user-images.githubusercontent.com/31490854/208408392-156a82fa-927a-4763-a2f4-ce525f9c7345.png)

11. Copy your `baserom.us.z64` into this folder. If you don't already have a `baserom.us.z64`, [here's the guide to obtain one](https://github.com/sanni/cartreader/wiki/What-to-order):

![image](https://user-images.githubusercontent.com/31490854/208409051-1f1b987e-eb2b-424a-b7fb-41a4faf4d1a0.png)

12. Go back to the MSYS2 window and execute a native build using this command:
```sh
WINDOWS_BUILD=1 HEADLESS=1 DISCORD_SDK=0 TOUCH_CONTROLS=1 make -j$(nproc)
```

13. When it completes, run these commands to navigate up three directories in MSYS2 to the `sm64ex-coop-android-base` folder, then create an SDL2 include symlink for the Android build:
```sh
cd ../../..
./getSDL.sh
```

**Perform Android build:**
> Do this in a normal Command Prompt!
```
gradlew.bat assembleDebug
```

## Arch Linux

> Assumes general Arch Linux experience, [`sudo`](https://wiki.archlinux.org/title/sudo), an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers), and [`multilib`](https://wiki.archlinux.org/title/Official_repositories#multilib) enabled.

**Install dependencies:**
```sh
yay -S base-devel jdk-openjdk android-sdk-cmdline-tools-latest android-sdk-build-tools a
ndroid-sdk-platform-tools android-platform python sdl2 glew
```

**Source `/etc/profile` to set `ANDROID_SDK_ROOT`:**
```sh
source /etc/profile
```

**Set default JDK to the newest one you see here:**
```sh
sudo archlinux-java status
sudo archlinux-java set java-19-openjdk
```

**Make Android SDK installation path writable and accept all SDK licenses:**
```sh
sudo -E chmod -R 777 $ANDROID_SDK_ROOT
sdkmanager --licenses
```

**Clone the repository:**
```sh
git clone --recursive https://github.com/robertkirkman/sm64ex-coop-android-base.git
cd sm64ex-coop-android-base
```

**Copy in your `baserom.us.z64`:**
```sh
cp /path/to/your/baserom.us.z64 app/jni/src/baserom.us.z64
```

**Create SDL2 include symlink:**
```sh
./getSDL.sh
```

**Perform native build:**
```sh
cd app/jni/src
DISCORD_SDK=0 TOUCH_CONTROLS=1 make -j$(nproc)
cd -
```

**Perform Android build:**
```sh
./gradlew assembleDebug
```

**Enjoy your apk:**
```sh
ls -la app/build/outputs/apk/debug/app-debug.apk
```

## Docker

**Clone the repository:**
```sh
git clone --recursive https://github.com/robertkirkman/sm64ex-coop-android-base.git
cd sm64ex-coop-android-base
```

**Build Docker image:**
```sh
docker build . -t sm64_android
```

**Copy in your `baserom.us.z64`:**
```sh
cp /path/to/your/baserom.us.z64 app/jni/src/baserom.us.z64
```

**Create SDL2 include symlink:**
```sh
docker run --rm -v $(pwd):/sm64 sm64_android sh -c "./getSDL.sh"
```

**Perform native build:**
```sh
docker run --rm -v $(pwd):/sm64 sm64_android sh -c "cd /sm64/app/jni/src && DISCORD_SDK=0 TOUCH_CONTROLS=1 make -j$(nproc)"
```

**Perform Android build:**
```sh
docker run --rm -v $(pwd):/sm64 sm64_android sh -c "./gradlew assembleDebug"
```

**Enjoy your apk:**
```sh
ls -la app/build/outputs/apk/debug/app-debug.apk
```

# Configuration
If you want to customize the build with build options, you should make the native build with those options first (put them after the `make` command like on normal repos), then before performing the Android build, edit `app/jni/src/Android.mk` and enable the options you'd like.
