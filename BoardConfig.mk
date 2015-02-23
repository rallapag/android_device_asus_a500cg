include $(GENERIC_X86_CONFIG_MK)
LOCAL_PATH := device/asus/a500cg

TARGET_BOARD_PLATFORM := clovertrail
TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_VARIANT := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_BOOTLOADER_BOARD_NAME := clovertrail
TARGET_CPU_SMP := true
INTEL_INGREDIENTS_VERSIONS := true
# Atom optimizations to improve memory benchmarks.
-include $(LOCAL_PATH)/OptAtom.mk

BOARD_CREATE_MODPROBE_SYMLINK := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
LOCAL_CFLAGS += -DARCH_IA32
BOARD_MALLOC_ALIGNMENT := 16


# Security SELinux
HAVE_SELINUX := true
BOARD_SEPOLICY_DIRS += device/asus/a500cg/sepolicy
BOARD_SEPOLICY_UNION += \
	file_contexts \
	seapp_contexts \
	file.te \
	genfs_contexts \
	device.te \
	surfaceflinger.te \
	vold.te \
	ecryptfs.te \
	zygote.te \
	su.te \
	pvrsrvctl.te \
	bluetooth.te \
	mediaserver.te \
	property_contexts

# Make settings
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel config (reference only)
BOARD_KERNEL_CMDLINE := init=/init pci=noearly console=logk0 earlyprintk=nologger loglevel=0 kmemleak=off androidboot.bootmedia=sdcard androidboot.hardware=redhookbay $(cmdline_extra) ip=50.0.0.2:50.0.0.1::255.255.255.0::usb0:on vmalloc=172M androidboot.wakesrc=05 androidboot.mode=main
cmdline_extra := watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789012345678901
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048


# File system
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1363148800
BOARD_FLASH_BLOCK_SIZE := 131072

#BUILD_WITH_FULL_STAGEFRIGHT := true

# Use this flag if the board has a ext4 partition larger than 2gb
TARGET_USERIMAGES_USE_EXT4 := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA   := "/system/etc/firmware/fw_bcmdhd_43362.bin"
WIFI_DRIVER_FW_PATH_AP    := "/system/etc/firmware/fw_bcmdhd_43362_apsta.bin"
WIFI_DRIVER_MODULE_ARG := "iface_name=wlan0 firmware_path=/system/etc/firmware/fw_bcmdhd_43362.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# GPS
BOARD_HAVE_GPS := true

# select libcamera2 as the camera HAL
USE_CAMERA_HAL2 := true

# Hack to use AVC to encode camera videos.
TARGET_NO_METADATA_ON_AVC_ENC := true

#HW_Renderer
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
# HWComposer
BOARD_USES_HWCOMPOSER := true
BOARD_ALLOW_EGL_HIBERNATION := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# USE_INTEL_MDP := true
# BOARD_USE_LIBVA_INTEL_DRIVER := true
# BOARD_USE_LIBVA := true
# BOARD_USE_LIBMIX := true
# BOARD_USES_WRS_OMXIL_CORE := true

# Force the screenshot path to CPU consumer
COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

# Enable WEBGL in WebKit
ENABLE_WEBGL := true


# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_SCREEN_WIDTH := 720
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/init/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/blobs/kernel-ww-2.20.40.13
TARGET_RECOVERY_INITRC := $(LOCAL_PATH)/init/recovery.init.redhookbay.rc
RECOVERY_SDCARD_ON_DATA := true

# Audio
BOARD_USES_ALSA_AUDIO := true
# BUILD_WITH_ALSA_UTILS := true
