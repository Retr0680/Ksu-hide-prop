#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
BACKUP_PATH=/data/local/tmp/ksu-hide-prop-backup

# Ensure module directory exists
if [ ! -d "$MODPATH" ] || [ -z "$(ls -A "$MODPATH")" ]; then
    echo "[!] Module directory missing, restoring from backup..."
    cp -r "$BACKUP_PATH" "$MODPATH"
    chmod -R 755 "$MODPATH"
    touch "$MODPATH/enable"
    chmod 644 "$MODPATH/enable"
    sync
fi