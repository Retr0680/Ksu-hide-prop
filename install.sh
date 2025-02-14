#!/system/bin/sh

echo "======================================"
echo " ██▀███  ▓█████▄▄▄█████▓ ██▀███   ▒█████  "
echo "▓██ ▒ ██▒▓█   ▀▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒"
echo "▓██ ░▄█ ▒▒███  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒"
echo "▒██▀▀█▄  ▒▓█  ▄░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░"
echo "░██▓ ▒██▒░▒████▒ ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░"
echo "░ ▒▓ ░▒▓░░░ ▒░ ░ ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░"
echo "  ░▒ ░ ▒░ ░ ░  ░   ░      ░▒ ░ ▒░  ░ ▒ ▒░"
echo "  ░░   ░    ░    ░        ░░   ░ ░ ░ ░ ▒ "
echo "   ░        ░  ░           ░         ░ ░"
echo "======================================"
echo "  KernelSU Prop Hide Module Installer"
echo "======================================"

MODPATH=/data/adb/modules/ksu-hide-prop
BACKUP_PATH=/data/local/tmp/ksu-hide-prop-backup

# Ensure module directory exists
mkdir -p "$MODPATH"

# Ensure module.prop exists
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

chmod +x $MODPATH/post-fs-data.sh
chmod +x $MODPATH/boot-completed.sh
chmod +x $MODPATH/service.sh
chmod +x $MODPATH/uninstall.sh

# Mark the module as enabled
touch "$MODPATH/enable"
chmod 644 "$MODPATH/enable"

# Prevent KernelSU cleanup
touch "$MODPATH/.disable_cleanup"
chmod 644 "$MODPATH/.disable_cleanup"

# Ensure correct permissions
chmod -R 755 "$MODPATH"

# Backup module in case KernelSU tries to remove it
rm -rf "$BACKUP_PATH"
cp -r "$MODPATH" "$BACKUP_PATH"
chmod -R 755 "$BACKUP_PATH"

sync
echo "[*] Installation completed! Please reboot."