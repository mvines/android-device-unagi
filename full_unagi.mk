$(call inherit-product, device/qcom/common/common.mk)
PRODUCT_COPY_FILES := \
  device/qcom/unagi/touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
  device/qcom/msm7627a/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

$(call inherit-product-if-exists, vendor/qcom/unagi/unagi-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/qcom/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d/dev/smd0 \
  ro.moz.cam.0.sensor_offset=270 \
  ro.use_data_netmgrd=true \
  ro.moz.ril.simstate_extra_field=true \
  ro.moz.ril.emergency_by_default=true

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_unagi
PRODUCT_DEVICE := unagi
PRODUCT_BRAND := toro
PRODUCT_MANUFACTURER := toro
PRODUCT_MODEL := unagi1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
