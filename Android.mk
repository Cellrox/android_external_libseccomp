LOCAL_PATH:= $(call my-dir)

libseccomp_SRC_FILES := \
	src/api.c \
	src/arch-arm.c \
	src/arch-arm-syscalls.c \
	src/arch.c \
	src/arch-x32.c \
	src/arch-x32-syscalls.c \
	src/arch-x86_64.c \
	src/arch-x86_64-syscalls.c \
	src/arch-x86.c \
	src/arch-x86-syscalls.c \
	src/db.c \
	src/gen_bpf.c \
	src/gen_pfc.c \
	src/hash.c

libseccomp_CFLAGS := -std=gnu89 -fvisibility=hidden ## -fomit-frame-pointer
libseccomp_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_SRC_FILES := $(libseccomp_SRC_FILES)
LOCAL_CFLAGS := $(libseccomp_CFLAGS) -ftrapv
LOCAL_C_INCLUDES := $(libseccomp_C_INCLUDES)

LOCAL_MODULE:= libseccomp

include $(BUILD_STATIC_LIBRARY)
