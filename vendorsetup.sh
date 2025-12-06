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
# ---------------------------------------------------------
# MotCamera4 APK download
APK_DIR="vendor/motorola/fogos/proprietary/product/priv-app/MotCamera4"
APK_NAME="MotCamera4.apk"
APK_URL="https://sourceforge.net/projects/fogos-rom/files/MotCamera4.apk/download"
mkdir -p "$APK_DIR"
if [ ! -f "$APK_DIR/$APK_NAME" ]; then
    echo "Downloading $APK_NAME..."
    wget -O "$APK_DIR/$APK_NAME" "$APK_URL"
    echo "Downloaded $APK_NAME to $APK_DIR"
else
    echo "$APK_NAME already exists, skipping download."
fi
