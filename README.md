# `sm64ex-coop` Android Port
This is a port of the [`sm64ex-coop` multiplayer mod for Super Mario 64](https://github.com/djoslin0/sm64ex-coop) to Android using SDL2 with OpenGL ES 2.0.

# Build Instructions

## Android

To compile only `libmain.so` (the minimum required) and use precompiled `libSDL2.so`, `classes.dex`, `.xml` files, and `resources.arsc`, follow the guide [here](https://github.com/robertkirkman/sm64ex-coop/blob/android/README_android.md)!

To compile fully on Android, including Java and SDL2 components, follow the instructions in the above link up to and including step 22, then use [this](https://github.com/Lzhiyong/termux-ndk/tree/master/build-app) guide on this repository (untested, theoretically possible - I will check viability and write precise steps if successful)

## Windows

> You will need at least 12 GB of free space on your `C:\` drive to install all the dependencies needed here

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

8. Next, run these commands to create a new folder (`C:\g\`) and change working directory to it (**IMPORTANT: it must be in this exact folder**), clone the repository, and navigate to the `sm64ex-coop-android-base/app/jni/src` directory:
```sh
cd /c
mkdir g
cd g
git clone --recursive https://github.com/robertkirkman/sm64ex-coop-android-base.git
cd sm64ex-coop-android-base/app/jni/src
```

9. Leave the MSYS2 window open for now and open a File Explorer window, then click "This PC" in the left column:

![image](https://user-images.githubusercontent.com/31490854/208407165-2042385b-6690-4e33-9728-d0d960e6c1b7.png)

![image](https://user-images.githubusercontent.com/31490854/208407299-cd79817b-e87a-4780-960f-a8353c9cd759.png)

10. Open drive `C:` and navigate to `C:\g\sm64ex-coop-android-base\app\jni\src`:

![image](https://user-images.githubusercontent.com/31490854/208407679-c8b338f6-f6c8-4e9a-a87e-805ed85973fb.png)

![image](https://user-images.githubusercontent.com/31490854/208706573-dad8bebb-787b-4f6e-a5ca-6994eaab68f9.png)

11. Copy your `baserom.us.z64` into this folder. If you don't already have a `baserom.us.z64`, [here's the guide to obtain one](https://github.com/sanni/cartreader/wiki/What-to-order):

![image](https://user-images.githubusercontent.com/31490854/208706937-b2398bb5-c63f-4f71-9d1b-bc2809daa27c.png)

12. Go back to the MSYS2 window and execute a native build using this command. This will take a long time:
```sh
HEADLESS=1 DISCORD_SDK=0 TOUCH_CONTROLS=1 make
```

13. When it completes, run these commands to navigate up three directories in MSYS2 to the `sm64ex-coop-android-base` folder, then copy SDL2 headers to a path necessary for the Android build:
```sh
cd ../../..
./getSDL.sh
```

14. Go to [the Android Studio website](https://developer.android.com/studio) and click "Download Android Studio":

![image](https://user-images.githubusercontent.com/31490854/208675391-f959541f-d14e-4f55-a2bc-52d8824f0894.png)

15. Check the box to agree to the terms and conditions, then click the download link:

![image](https://user-images.githubusercontent.com/31490854/208675761-8501e900-fc87-4af5-9a17-13b726392b45.png)

16. Repeat step 2 but for the Android Studio installer, then click "Next" 3 times and "Install" once, and wait for the installation to complete:

![image](https://user-images.githubusercontent.com/31490854/208676783-eeb4e9a2-6c68-4d57-80b0-7ce09b26dd66.png)

17. Click "Next", then "Finish", then click "OK" when this box appears:

![image](https://user-images.githubusercontent.com/31490854/208677005-7a4f09bd-638e-40e4-b2a4-4eba3f69757a.png)

18. When this window appears, click "Don't send", then click "Next" four times:

![image](https://user-images.githubusercontent.com/31490854/208677271-f5a88f53-a057-4823-8280-a46b00755874.png)

19. When you see this, click "Accept", then click either one of the "Intel" buttons to the left and click "Accept" again, then click "Finish" and wait for the installation to complete:

![image](https://user-images.githubusercontent.com/31490854/208677663-fb253a85-ea3e-4a62-9ec3-01f3cae20866.png)

20. When the "Finish" button becomes clickable again, click it:

![image](https://user-images.githubusercontent.com/31490854/208678536-927dc74d-6b1e-428e-9594-ff0e838f15ac.png)

21. Then, click "Open" when you see this window:

![image](https://user-images.githubusercontent.com/31490854/208678663-0486f63d-a4fc-4961-93d0-62a7c16a3e3b.png)

22. Navigate to `C:\g\sm64ex-coop-android-base`, then click "OK":

![image](https://user-images.githubusercontent.com/31490854/208699012-c05add71-4376-4792-82b1-c83787db96e1.png)

23. Click "Trust Project" when you see this, then wait for the project to open:

![image](https://user-images.githubusercontent.com/31490854/208679054-afa86c8d-d73d-43fe-a020-bcd75c1ad632.png)

24. When you see the Windows Defender Firewall popup, click anything because you do not need to use ADB just to build - you can copy the `.apk` to your device over MTP later:

![image](https://user-images.githubusercontent.com/31490854/208679495-a81d7e47-93f8-41ba-97c6-443ea707548b.png)

25. Wait for this progress bar in the bottom right to stop loading. This will take a long time:

![image](https://user-images.githubusercontent.com/31490854/208679983-08702711-03ac-4062-8539-8ecce41dac10.png)

26. When the progress bar disappears, the hammer icon in the top center will turn green. Click it, then wait for a progress bar in the same place as step 25 to finish loading again. This will take a long time:

![image](https://user-images.githubusercontent.com/31490854/208681749-b6c34870-9aad-4450-9afd-15f2efecd53e.png)

27. Open File Explorer and navigate to `C:\g\sm64ex-coop-android-base\app\build\outputs\apk\debug`. If the build was successful, the `app-debug.apk` will be here, and you can copy it to **_your_** Android device and install it there. **Do not share, remember the `.apk` contains assets! Treat it the same way you would a `sm64.us.f3dex2e.exe`!**

![image](https://user-images.githubusercontent.com/31490854/208705298-f5e6888e-4d33-42af-acb4-9c217dd89992.png)

> For more information and follow-up steps for what to do on-device after obtaining the `.apk`, check out the [submodule repository READMEs](https://github.com/robertkirkman/sm64ex-coop).

## Arch Linux

> Assumes general Arch Linux experience, [`sudo`](https://wiki.archlinux.org/title/sudo), an [AUR helper](https://wiki.archlinux.org/title/AUR_helpers), and [`multilib`](https://wiki.archlinux.org/title/Official_repositories#multilib) enabled.

**Install dependencies:**
```sh
yay -S base-devel jdk-openjdk android-sdk-cmdline-tools-latest android-sdk-build-tools android-sdk-platform-tools android-platform python sdl2 glew
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
