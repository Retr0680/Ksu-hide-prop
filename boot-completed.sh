#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
BACKUP_PATH=/data/local/tmp/ksu-hide-prop-backup

# Wait for system to boot fully
sleep 5

# Restore module if it's deleted
if [ ! -d "$MODPATH" ] || [ -z "$(ls -A $MODPATH)" ]; then
    echo "[!] Module directory is empty! Restoring..."
    cp -r "$BACKUP_PATH" "$MODPATH"
    chmod -R 755 "$MODPATH"
    chown -R root:root "$MODPATH"
fi

# General root hiding
resetprop ro.debuggable 0
resetprop ro.secure 1
resetprop ro.build.type user
resetprop persist.kernel.su 0
resetprop ro.kernel.qemu 0
resetprop ro.adb.secure 1
resetprop ro.bootmode unknown
resetprop ro.boot.verifiedbootstate green
resetprop ro.boot.flash.locked 1
resetprop ro.boot.vbmeta.device_state locked
resetprop ro.boot.warranty_bit 0
resetprop ro.vendor.boot.warranty_bit 0

# Hide KernelSU-specific traces
resetprop persist.ksu.enabled 0
resetprop persist.kernel.su 0

echo "[✔] Root hiding completed."
exit 0