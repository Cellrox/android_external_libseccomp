LOCAL_PATH:= $(call my-dir)

# from src/Makefile: SOURCES_ARCH
libseccomp_SOURCES_ARCH := \
	arch.c arch.h \
	arch-x86.h arch-x86.c arch-x86-syscalls.c \
	arch-x86_64.h arch-x86_64.c arch-x86_64-syscalls.c \
	arch-x32.h arch-x32.c arch-x32-syscalls.c \
	arch-arm.h arch-arm.c arch-arm-syscalls.c \
	arch-aarch64.h arch-aarch64.c arch-aarch64-syscalls.c \
	arch-mips.h arch-mips.c arch-mips-syscalls.c \
	arch-mips64.h arch-mips64.c arch-mips64-syscalls.c \
	arch-mips64n32.h arch-mips64n32.c arch-mips64n32-syscalls.c

# from src/Makefile: SOURCES_GEN
libseccomp_SOURCES_GEN := \
	api.c system.h system.c \
	db.h db.c \
	hash.h hash.c \
	gen_pfc.h gen_pfc.c gen_bpf.h gen_bpf.c

include $(CLEAR_VARS)

LOCAL_CLANG := true

LOCAL_SRC_FILES := \
	$(addprefix src/,$(libseccomp_SOURCES_GEN)) \
	$(addprefix src/,$(libseccomp_SOURCES_ARCH))

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)

LOCAL_MODULE:= libseccomp

include $(BUILD_STATIC_LIBRARY)

