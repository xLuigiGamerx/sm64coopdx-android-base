# `SM64CoopDX` Android Port Gradle Base
This allows you to compile [Super Mario 64 Coop Deluxe](https://github.com/ManIsCat2/sm64coopdx/) for android using gradle or android studio.

# Build Instructions

## Windows

### Dependencies

**1.** Download the newest version of the MSYS2 installer from [here](https://github.com/msys2/msys2-installer/releases) and install it.

**2.** Run MINGW64 (mingw64.exe)

**3.** Enter `pacman -Syuu` in the prompt and hit Enter. Press `Y` when it asks if you want to update packages. If it asks you to close the prompt, do so, then restart it and run the same command again. This updates the packages to their latest versions.

**4.** Run this command in the MSYS2 window to install native build dependencies:
```sh
pacman -S --noconfirm unzip make git mingw-w64-x86_64-gcc python3
```

**5.** Next, run these commands to create a new folder (`C:\g\`) and change working directory to it (**Note: it can be on any drive, just make sure that it's in the `g` folder at the root**), clone the repository, and navigate to the `sm64coopdx-android-base/app/jni/src` directory:
```sh
cd /c
mkdir g
cd g
git clone --recursive https://github.com/robertkirkman/sm64ex-coop-android-base.git
cd sm64ex-coop-android-base/app/jni/src
```

**7.** Run this command to start compiling. This will take a long time:

```sh
make -j TOUCH_CONTROLS=1
```

**8.** Download and install Android Studio from [here](https://developer.android.com/studio).


**9.** When you see this, click "Accept", then click either one of the "Intel" buttons to the left and click "Accept" again, then click "Finish" and wait for the installation to complete:

![image](https://user-images.githubusercontent.com/31490854/208677663-fb253a85-ea3e-4a62-9ec3-01f3cae20866.png)

**10.** Once it finishes, click `Finish`:

**11.** Then, click "Open" and select your android base repo:

**12.** Click "Trust Project" when you see this, then wait for the project to open:

![image](https://user-images.githubusercontent.com/31490854/208679054-afa86c8d-d73d-43fe-a020-bcd75c1ad632.png)

**13.** When you see the Windows Defender Firewall popup, click anything because you do not need to use ADB just to build.

**14.** Wait for this progress bar in the bottom right to stop loading. This will take a bit of time:

![image](https://user-images.githubusercontent.com/31490854/208679983-08702711-03ac-4062-8539-8ecce41dac10.png)

**15.** When the progress bar disappears, the hammer icon in the top will be clickable. Click it, then wait for it to build.

**16.** Once it finishes, the `apk` should generate at `C:\g\sm64coopdx-android-base\app\build\outputs\apk\debug`.

**17.** Copy the `apk` to your android device and install it and enjoy SM64CoopDX on Android.

## Arch Linux

> Assumes general Arch Linux experience, [`sudo`](https://wiki.archlinux.org/title/sudo), an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers), and [`multilib`](https://wiki.archlinux.org/title/Official_repositories#multilib) enabled.

**Install dependencies:**
```sh
yay -S base-devel jdk17-openjdk android-sdk-cmdline-tools-latest android-sdk-build-tools android-sdk-platform-tools android-platform python sdl2 glew readline
```

**Source `/etc/profile` to set `ANDROID_SDK_ROOT`:**
```sh
source /etc/profile
```

**Set default JDK to `java-17-openjdk`:**
```sh
sudo archlinux-java status
sudo archlinux-java set java-17-openjdk
```

**Make Android SDK installation path writable and accept all SDK licenses:**
```sh
sudo -E chmod -R 777 $ANDROID_SDK_ROOT
sdkmanager --licenses
```

**Clone the repository:**
```sh
git clone --recursive https://github.com/xLuigiGamerx/sm64coopdx-android-base.git
cd sm64coopdx-android-base
```

**Perform native build:**
```sh
cd app/jni/src
TOUCH_CONTROLS=1 make -j$(nproc)
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
git clone --recursive https://github.com/xLuigiGamerx/sm64coopdx-android-base.git
cd sm64coopdx-android-base
```

**Build Docker image:**
```sh
docker build . -t sm64_android
```

**Perform native build:**
```sh
docker run --rm -v $(pwd):/sm64 sm64_android sh -c "cd /sm64/app/jni/src && TOUCH_CONTROLS=1 make -j$(nproc)"
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
