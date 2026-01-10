#!/bin/bash
clone_if_missing() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3
    if [ ! -d "$target_dir" ]; then
        echo "Cloning $target_dir..."
        if [ -n "$branch" ]; then
            git clone "$repo_url" -b "$branch" "$target_dir"
        else
            git clone "$repo_url" "$target_dir"
        fi
        echo "Done."
    fi
}
# Git clones
clone_if_missing "https://github.com/JNWSG/Lineage_android_device_motorola_fogos.git" "16.2" "device/motorola/fogos"
clone_if_missing "https://github.com/JNWSG/Lineage_android_device_motorola_sm6375-common.git" "16.2" "device/motorola/sm6375-common"
clone_if_missing "https://github.com/JNWSG/Lineage_android_vendor_motorola_fogos.git" "16.2" "vendor/motorola/fogos"
clone_if_missing "https://github.com/JNWSG/Lineage_android_vendor_motorola_sm6375-common.git" "16.2" "vendor/motorola/sm6375-common"
clone_if_missing "https://github.com/JNWSG/Lineage_android_kernel_motorola_sm6375.git" "16.2" "kernel/motorola/sm6375"
# Additional repos
clone_if_missing "https://github.com/JNWSG/Lineage_hardware_motorola.git" "16.2" "hardware/motorola"
clone_if_missing "https://github.com/JNWSG/hardware_dolby.git" "16.0" "hardware/dolby"
clone_if_missing "https://github.com/LineageOS/android_hardware_samsung_slsi_nfc.git" "" "hardware/samsung_slsi/nfc"
clone_if_missing "https://github.com/JNWSG/packages_apps_ViPER4AndroidFX.git" "v4a" "packages/apps/ViPER4AndroidFX"
clone_if_missing "https://gitea.com/JNWSG/vendor_motorola_MotCamera4.git" "16.0" "vendor/motorola/MotCamera4"
# ---------------------------------------------------------
MOTCAMERA_BLOCK="# Inherit MotCamera config
PRODUCT_PACKAGES += \\
    MotCamera4
\$(call inherit-product, vendor/motorola/MotCamera4/motcamera4.mk)"
if ! grep -q "MotCamera4/motcamera4.mk" device/motorola/fogos/device.mk 2>/dev/null; then
    echo "" >> device/motorola/fogos/device.mk
    echo "$MOTCAMERA_BLOCK" >> device/motorola/fogos/device.mk
fi
