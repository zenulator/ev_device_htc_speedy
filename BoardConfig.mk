# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true
TARGET_LEGACY_CAMERA := true

TARGET_CAMERA_WRAPPER := speedy
ifneq ($(TARGET_CAMERA_WRAPPER),)
PRODUCT_COPY_FILES += \
    device/htc/speedy/proprietary/libcamera-$(TARGET_CAMERA_WRAPPER).so:obj/lib/libcamera-$(TARGET_CAMERA_WRAPPER).so \
    device/htc/speedy/proprietary/libcamera-$(TARGET_CAMERA_WRAPPER).so:/system/lib/libcamera-$(TARGET_CAMERA_WRAPPER).so \
    device/htc/speedy/proprietary/libcamera-$(TARGET_CAMERA_WRAPPER).so:obj/lib/libcamera.so \
    device/htc/speedy/proprietary/libcamera-$(TARGET_CAMERA_WRAPPER).so:/system/lib/libcamera.so
else
PRODUCT_COPY_FILES += \
    vendor/htc/speedy/proprietary/libcamera.so:obj/lib/libcamera.so \
    vendor/htc/speedy/proprietary/libcamera.so:/system/lib/libcamera.so
endif

# inherit from the proprietary version
-include vendor/htc/speedy/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := speedy
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/speedy/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"

BOARD_USE_LEGACY_TOUCHSCREEN := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 1200

BOARD_USE_NEW_LIBRIL_HTC := true

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x4000000
BOARD_KERNEL_PAGE_SIZE := 4096

BOARD_CAMERA_USE_GETBUFFERINFO := true

BOARD_EGL_CFG := device/htc/speedy/prebuilt/system/lib/egl/egl.cfg
BOARD_USES_ADRENO_200 := true
ARCH_ARM_HAVE_VFP := true
USE_OPENGL_RENDERER := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_GENLOCK := true
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_GRALLOC_USES_ASHMEM := true

#TARGET_QCOM_HDMI_OUT := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true
#BOARD_USES_QCOM_GPS := true
BOARD_USE_QCOM_PMEM := true

COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

#COMMON_GLOBAL_CFLAGS += \
#    -DMISSING_EGL_EXTERNAL_IMAGE \
#    -DMISSING_EGL_PIXEL_FORMAT_YV12 \
#    -DMISSING_GRALLOC_BUFFERS

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := speedy
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 0087f400 00000200 "recovery"
#mmcblk0p22: 00400000 00000200 "boot"
#mmcblk0p26: 1f7bf600 00000200 "system"
#mmcblk0p28: 09a7fa00 00000200 "cache"
#mmcblk0p27: 1bbffe00 00000200 "userdata"
#mmcblk0p31: 01400200 00000200 "devlog"
#mmcblk0p32: 00040000 00000200 "pdata"
#mmcblk0p25: 00c00200 00000200 "wimax"
#mmcblk0p30: 007ffa00 00000200 "udata_wimax"

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 435941376
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1394606080
BOARD_BOOTIMAGE_PARTITION_SIZE := 4194304
BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_PREBUILT_KERNEL := device/htc/speedy/kernel

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := 1
#BOARD_USES_RECOVERY_CHARGEMODE := true
