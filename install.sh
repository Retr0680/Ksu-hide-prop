#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
BACKUP_PATH=/data/local/tmp/ksu-hide-prop-backup

# Ensure module directory exists
mkdir -p "$MODPATH"
chmod 755 "$MODPATH"

# Create module.prop if missing
if [ ! -f "$MODPATH/module.prop" ]; then
    cat <<EOF > "$MODPATH/module.prop"
id=ksu-hide-prop
name=KSU Prop Modifier
version=2.1
versionCode=1
author=Retr0_680
description=Module to modify system properties at boot
EOF
    chmod 644 "$MODPATH/module.prop"
fi

# Ensure module is enabled
touch "$MODPATH/enable"
chmod 644 "$MODPATH/enable"

# Prevent KernelSU from cleaning the module
touch "$MODPATH/.disable_cleanup"

# Backup module in case it's deleted on reboot
rm -rf "$BACKUP_PATH"
cp -r "$MODPATH" "$BACKUP_PATH"

# Ensure boot script runs after reboot
mkdir -p /data/adb/service.d/
cp -f "$MODPATH/boot-completed.sh" /data/adb/service.d/ksu-hide-prop.sh"
chmod +x /data/adb/service.d/ksu-hide-prop.sh"

echo "[✔] Module installed successfully!"
exit 0