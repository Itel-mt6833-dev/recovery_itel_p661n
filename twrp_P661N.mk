#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from Itel-P661N device
$(call inherit-product, device/itel/P661N/device.mk)

# Device Target Name
PRODUCT_DEVICE := P661N
PRODUCT_NAME := twrp_P661N
PRODUCT_BRAND := Itel
PRODUCT_MODEL := Itel P55 5G
PRODUCT_MANUFACTURER := ITEL

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vnd_p661n_h334-user 12 SP1A.210812.016 699017 release-keys"
 
BUILD_FINGERPRINT := Itel/P661N-GL/itel-P661N:12/SP1A.210812.016/240910V135:user/release-keys
