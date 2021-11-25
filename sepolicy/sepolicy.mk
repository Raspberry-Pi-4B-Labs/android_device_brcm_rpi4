# Device specific SELinux policy variable definitions
SEPOLICY_PATH:= device/brcm/rpi4/sepolicy

ifneq ($(filter rpi4,$(TARGET_DEVICE)),)

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(SEPOLICY_PATH)/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(SEPOLICY_PATH)/public
BOARD_VENDOR_SEPOLICY_DIRS += $(SEPOLICY_PATH)/vendor

endif