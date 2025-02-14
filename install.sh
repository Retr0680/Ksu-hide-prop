#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop

# Clear the screen for a clean look
clear 

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
sleep 2

# Ensure module directory exists
mkdir -p "$MODPATH"
chmod 755 "$MODPATH"

# Ensure necessary scripts have execute permissions
chmod +x "$MODPATH/boot-completed.sh"
chmod +x "$MODPATH/update.sh"

# Move boot script to service.d for execution at boot
mkdir -p /data/adb/service.d/
cp -f "$MODPATH/boot-completed.sh" /data/adb/service.d/ksu-hide-prop.sh
chmod +x /data/adb/service.d/ksu-hide-prop.sh

# Run the update script if available
if [ -f "$MODPATH/update.sh" ]; then
    sh "$MODPATH/update.sh"
fi

# Mark installation as successful
touch "$MODPATH/ksu_installed"

echo "[*] KernelSU module installed successfully!"
exit 0