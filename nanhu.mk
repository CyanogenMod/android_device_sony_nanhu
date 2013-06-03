#
# Copyright (C) 2011 The CyanogenMod Project
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

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/nanhu/nanhu-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/nanhu/overlay

# Inherit the tamsui-common definitions
$(call inherit-product, device/sony/tamsui-common/tamsui.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/config/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/config/init.device.rc:root/init.device.rc \
    device/sony/tamsui-common/prebuilt/logo_M.rle:root/logo.rle

# USB function switching
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/init.sony.usb.rc:root/init.sony.usb.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/fstab.sony:root/fstab.sony

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab

# Device specific part for two-stage boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/bootrec-device:recovery/bootrec-device

# Ramdisk
PRODUCT_COPY_FILES += \
    device/sony/nanhu/prebuilt/rmt_storage:root/sbin/rmt_storage \
    device/sony/nanhu/prebuilt/ta_rmt_service:root/sbin/ta_rmt_service \
    device/sony/nanhu/prebuilt/tad:root/sbin/tad \
    device/sony/nanhu/prebuilt/wait4tad:root/sbin/wait4tad

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/config/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    $(LOCAL_PATH)/config/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    $(LOCAL_PATH)/config/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/config/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/nanhu/nanhu-vendor.mk)

