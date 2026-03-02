#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Allow building with minimal manifest

DEVICE_PATH := device/tecno/le7n

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Platform
TARGET_BOARD_PLATFORM := mt6768
TARGET_USES_UEFI := true
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
TARGET_BOOTLOADER_BOARD_NAME := tecno_le7n
TARGET_NO_BOOTLOADER := true
TARGET_OTA_ASSERT_DEVICE := tecno_le7n

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_PAGESIZE := 2048
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_DTB_OFFSET := 0x0bc08000
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
TARGET_KERNEL_ARCH := arm64
BOARD_INCLUDE__DTB_IN_BOOTIMG := true

# Boot Image Arguments
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata tranfs

# AB & Dynamic Partitions
AB_OTA_UPDATER := true
BOARD_SUPER_PARTITION_SIZE := 7516192768
BOARD_SUPER_PARTITION_GROUPS := tecno_dynamic_partitions
BOARD_TECNO_DYNAMIC_PARTITIONS_SIZE := 7516192768
BOARD_TECNO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product

# Recovery Strategy
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# PBRP / TWRP GUI & Optimization
TW_RECOVERY_GUI := true
# PBRP требует GUI для работы своих скриптов, но мы максимально его сожмем
TW_FRAMEBUFFER_DEFAULT_FORMAT := "RGBA_8888"
DEVICE_SCREEN_WIDTH := 1080
DEVICE_SCREEN_HEIGHT := 2460
TW_THEME := portrait_hdpi

# Drastic Size Reduction for PBRP
TW_EXCLUDE_PYTHON := true
TW_EXCLUDE_LVM_TOOLS := true
TW_EXCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := false
TW_INCLUDE_REPACKTOOLS := false
TW_NO_TWRPAPP := true
TWRP_INCLUDE_LOGCAT := false
TW_EXTRA_LANGUAGES := false
TW_DEFAULT_LANGUAGE := en
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Compression (CRITICAL for 32MB)
BOARD_RAMDISK_COMPRESSION := lzma
$(call inherit-product, build/make/target/product/generic_ramdisk.mk)

# HIDL & Graphics workaround
TW_EXCLUDE_HIDL := true

# PitchBlack Specific
PB_DISABLE_DEFAULT_TREES := true
PB_VANILLA_BUILD := true

# Security Patch Level
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.0.0

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3
