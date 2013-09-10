LOCAL_PATH:= $(call my-dir)/src/

common_SRC_FILES := \
	api.c \
	arch-arm.c \
	arch-arm-syscalls.c \
	arch.c \
	arch-x32.c \
	arch-x32-syscalls.c \
	arch-x86_64.c \
	arch-x86_64-syscalls.c \
	arch-x86.c \
	arch-x86-syscalls.c \
	db.c \
	gen_bpf.c \
	gen_pfc.c \
	hash.c

common_CFLAGS := -std=gnu89 -fvisibility=hidden ## -fomit-frame-pointer
common_C_INCLUDES += \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/..

include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_CFLAGS += $(common_CFLAGS) -ftrapv
LOCAL_C_INCLUDES += $(common_C_INCLUDES)

LOCAL_MODULE:= libseccomp

include $(BUILD_STATIC_LIBRARY)
