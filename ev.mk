# Inherit AOSP device configuration for speedy.
$(call inherit-product, device/htc/speedy/full_speedy.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_speedy
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := speedy
PRODUCT_MODEL := PG06100
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 PRODUCT_NAME=htc_speedy BUILD_FINGERPRINT=sprint/htc_speedy/speedy:2.3.3/GRI40/74499:user/release-keys PRIVATE_BUILD_DESC="2.76.651.4 CL74499 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME = shift
PRODUCT_VERSION_DEVICE_SPECIFIC := alpha2

PRODUCT_MOTD :="Welcome to ics-deck"

PRODUCT_PACKAGES += \
    Camera

# USB
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage
#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
