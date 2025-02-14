#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
BACKUP_PATH=/data/local/tmp/ksu-hide-prop-backup
REBOOT_COUNT_FILE="/data/local/tmp/reboot_count"
MAX_REBOOTS=3

# Wait for system to fully boot
sleep 10

# Restore module if it's missing
if [ ! -d "$MODPATH" ] || [ -z "$(ls -A "$MODPATH")" ]; then
    echo "[!] Module directory missing, restoring from backup..."
    cp -r "$BACKUP_PATH" "$MODPATH"
    chmod -R 755 "$MODPATH"
    touch "$MODPATH/enable"
    chmod 644 "$MODPATH/enable"
    sync
fi

# Prevent infinite reboot loop
if [ ! -f "$REBOOT_COUNT_FILE" ]; then
    echo 0 > "$REBOOT_COUNT_FILE"
fi

REBOOT_COUNT=$(cat "$REBOOT_COUNT_FILE")
if [ "$REBOOT_COUNT" -ge "$MAX_REBOOTS" ]; then
    echo "[X] Too many reboots, stopping restore process."
    exit 1
fi

if [ ! -d "$MODPATH" ]; then
    cp -r /sdcard/ksu-hide-prop "$MODPATH"
    chmod -R 755 "$MODPATH"
    echo $((REBOOT_COUNT + 1)) > "$REBOOT_COUNT_FILE"
    reboot
fi

# General root hiding
resetprop -n ro.debuggable 0
resetprop -n ro.secure 1
resetprop -n ro.build.type user
resetprop -n persist.kernel.su 0
resetprop -n ro.kernel.qemu 0
resetprop -n ro.adb.secure 1
resetprop -n ro.bootmode unknown
resetprop -n ro.boot.verifiedbootstate green
resetprop -n ro.boot.flash.locked 1
resetprop -n ro.boot.vbmeta.device_state locked
resetprop -n ro.boot.warranty_bit 0
resetprop -n ro.vendor.boot.warranty_bit 0

# Hide KernelSU-specific traces
resetprop -n persist.ksu.enabled 0
resetprop -n persist.kernel.su 0

echo "[✔] Root hiding completed."