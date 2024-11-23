#
# Copyright (C) 2024 mrjarvis698
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


DEVICE_PATH := device/brcm/rpi4

# Audio - TinyHAL
BOARD_USES_TINYHAL_AUDIO := true
TINYCOMPRESS_TSTAMP_IS_LONG := true
TINYALSA_NO_ADD_NEW_CTRLS := true
TINYALSA_NO_CTL_GET_ID := true

#Bluetooth
BOARD_HAVE_BLUETOOTH := true

# SOC Board Configuration for Broadcom BCM2711
TARGET_BOARD_PLATFORM := rpi

# Primary Architecture Settings
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a72

# Secondary Architecture Settings (for compatibility)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00078000
BOARD_KERNEL_CMDLINE := androidboot.hardware=rpi4 coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 snd_bcm2835.enable_headphones=1 vc_mem.mem_base=0x3ec00000 vc_mem.mem_size=0x40000000 console=ttyS0,115200
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := android_rpi4_defconfig
TARGET_KERNEL_SOURCE := kernel/brcm/rpi4

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := raspberrypifoundation_dynamic_partitions
BOARD_RASPBERRYPIFOUNDATION_DYNAMIC_PARTITIONS_PARTITION_LIST := \
	system \
	system_ext \
    product \
	vendor \
    vendor_dlkm
BOARD_RASPBERRYPIFOUNDATION_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/properties/vendor_dlkm.prop

# Matrix HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/matrix_hidl/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/matrix_hidl/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/matrix_hidl/framework_compatibility_matrix.xml

# Sepolicy - Device
include device/brcm/rpi4/sepolicy/sepolicy.mk
