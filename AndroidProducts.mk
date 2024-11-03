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

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/brcm_rpi4.mk

COMMON_LUNCH_CHOICES := \
    brcm_rpi4-ap3a-user \
    brcm_rpi4-ap3a-userdebug \
    brcm_rpi4-ap3a-eng \
    brcm_rpi4-root-user \
    brcm_rpi4-root-userdebug \
    brcm_rpi4-root-eng \
    brcm_rpi4-trunk_staging-user \
    brcm_rpi4-trunk_staging-userdebug \
    brcm_rpi4-trunk_staging-eng
