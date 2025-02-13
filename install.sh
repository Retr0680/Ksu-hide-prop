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

# Define the module's installation path
MODPATH=${MODPATH:-/data/adb/modules/ksu-prop-modifier}

# Check if the module path exists
if [ ! -d "$MODPATH" ]; then
    echo "[!] Module path does not exist: $MODPATH"
    exit 1
fi

# Check if the script is running with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] This script must be run as root."
    exit 1
fi

# Copy the boot-completed.sh file to the correct location
echo "[*] Copying boot-completed.sh to /system/bin/"
cp -f "$MODPATH/boot-completed.sh" /system/bin/
if [ $? -eq 0 ]; then
    echo "[✔] boot-completed.sh copied successfully."
else
    echo "[!] Failed to copy boot-completed.sh"
    exit 1
fi

# Copy the update.sh file to the correct location
echo "[*] Copying update.sh to /system/bin/"
cp -f "$MODPATH/update.sh" /system/bin/
if [ $? -eq 0 ]; then
    echo "[✔] update.sh copied successfully."
else
    echo "[!] Failed to copy update.sh"
    exit 1
fi

# Set executable permissions for the copied scripts
echo "[*] Setting executable permissions for boot-completed.sh and update.sh"
chmod +x /system/bin/boot-completed.sh
chmod +x /system/bin/update.sh

# Verify if the permissions were set successfully
if [ $? -eq 0 ]; then
    echo "[✔] Permissions set successfully."
else
    echo "[!] Failed to set permissions."
    exit 1
fi

# Confirm installation
if [ -x /system/bin/boot-completed.sh ] && [ -x /system/bin/update.sh ]; then
    echo "[✔] Installation complete."
else
    echo "[!] Installation failed. One or both scripts are not executable."
    exit 1
fi

# Optional: Print further instructions or clean-up steps if necessary
echo "[*] Please reboot your device to apply changes."