#!/system/bin/sh

# Set module path
MODPATH=/data/adb/modules/Ksu-hide-prop

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
sleep 2  # Wait for 2 seconds before proceeding

# Ensure module directory exists
mkdir -p "$MODPATH"
chmod 755 "$MODPATH"

# Extract module files
unzip -o "$ZIPFILE" -d "$MODPATH" > /dev/null 2>&1
chmod -R 755 "$MODPATH"

# Ensure necessary scripts have execute permissions
if [ -f "$MODPATH/boot-completed.sh" ]; then
    chmod +x "$MODPATH/boot-completed.sh"
fi

if [ -f "$MODPATH/update.sh" ]; then
    chmod +x "$MODPATH/update.sh"
    sh "$MODPATH/update.sh"
fi

# Run the boot script
if [ -f "$MODPATH/boot-completed.sh" ]; then
    sh "$MODPATH/boot-completed.sh"
fi

# Mark installation as successful
touch "$MODPATH/ksu_installed"

echo "[*] KernelSU module installed successfully!"
exit 0