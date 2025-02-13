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

# Copy necessary files to module directory
cp -af "$ZIPFILE" "$MODPATH/"
chmod -R 755 "$MODPATH"

# Ensure necessary scripts have execute permissions
chmod +x "$MODPATH/boot-completed.sh"
chmod +x "$MODPATH/update.sh"

# Run the update script
if [ -f "$MODPATH/update.sh" ]; then
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