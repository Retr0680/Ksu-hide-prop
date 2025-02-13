#!/system/bin/sh

# Clear screen for a clean look
clear

# ASCII Logo
echo "======================================"
echo " ██▀███  ▓█████▄▄▄█████▓ ██▀███   ▒█████  "
echo "▓██ ▒ ██▒▓█   ▀▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒"
echo "▓██ ░▄█ ▒▒███  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒"
echo "▒██▀▀█▄  ▒▓█  ▄░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░"
echo "░██▓ ▒██▒░▒████▒ ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░"
echo "░ ▒▓ ░▒▓░░░ ▒░ ░ ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░"
echo "  ░▒ ░ ▒░ ░ ░  ░   ░      ░▒ ░ ▒░  ░ ▒ ▒░"
echo "  ░░   ░    ░    ░        ░░   ░ ░ ░ ░ ▒ "
echo "   ░        ░  ░           ░         ░ ░ "
echo "======================================"
echo "  KernelSU Prop Hide Module Installer"
echo "======================================"

# Wait for 2 seconds before proceeding
sleep 2

echo -e "\e[32m[*] Checking for updates...\e[0m"
sh "$MODPATH/update.sh"  # Run the update script

# Set permissions for boot-completed script
chmod +x "$MODPATH/boot-completed.sh"

# Ensure boot-completed script runs on boot
cp "$MODPATH/boot-completed.sh" /data/adb/service.d/ksu-hide-prop.sh
chmod +x /data/adb/service.d/ksu-hide-prop.sh

# Confirm installation completion
echo -e "\e[32m[*] Module installed successfully!\e[0m"