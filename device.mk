#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
#

LOCAL_PATH := device/itel/P661N

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable Virtual A/B OTA
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch.mk)

# Virtual A/B Partition 
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system_ext \
    vendor \
    system \
    boot \
    vbmeta_system \
    product \
    vbmeta_vendor

# A/B Post-Install Configuration
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Boot Control Dependency
PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Boot Control HAL v1.2
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service    

PRODUCT_PACKAGES := \
    bootctrl.mt6833 \
    libgptutils \
    libz \
    libcutils \

# Update Engine Client
PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# A/B Flags
PRODUCT_PACKAGES += \
    otapreopt_script \
    checkpoint_gc

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0-impl-mock

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service.rc

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Bootctrl Utils
PRODUCT_PACKAGES += \
    bootctrl \
    bootctrl.recovery

# Recovery modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libresetprop \
    libkeymaster4 \
    libkeymaster41 \
    libtrustonic_keybox_ca \
    libimsg_log \
    android.hardware.boot@1.0

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libresetprop.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrustonic_keybox_ca.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libimsg_log.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.boot@1.0.so

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
