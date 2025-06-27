# Store this Android.mk's path
MY_LOCAL_PATH := $(call my-dir)
LOCAL_PATH := $(MY_LOCAL_PATH)

# Register SDL2 as a prebuilt shared library
include $(CLEAR_VARS)

LOCAL_MODULE := SDL2
LOCAL_SRC_FILES := lib/sdl/arm64-v8a/libSDL2.so
LOCAL_C_INCLUDES := $(LOCAL_PATH)/lib/sdl/include

include $(PREBUILT_SHARED_LIBRARY)

# Include your actual game/native source module
LOCAL_PATH := $(MY_LOCAL_PATH)
include $(LOCAL_PATH)/src/Android.mk