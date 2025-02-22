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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from rpi4 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_NAME := aosp_rpi4
PRODUCT_DEVICE := rpi4
PRODUCT_BRAND := brcm
PRODUCT_MODEL := Android on rpi4
PRODUCT_MANUFACTURER := Raspberry Foundations
