#!/system/bin/sh

# Define module path
MODPATH=/data/adb/modules/Ksu-hide-prop

# Clear screen for a clean look
clear

# Display ASCII logo
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

echo -e "\e[32m[*] Checking for updates...\e[0m"

# Run update.sh if it exists
if [ -f "$MODPATH/update.sh" ]; then
    chmod +x "$MODPATH/update.sh"
    sh "$MODPATH/update.sh" || echo -e "\e[31m[!] update.sh execution failed!\e[0m"
else
    echo -e "\e[31m[!] update.sh not found. Skipping update check.\e[0m"
fi

# Set permissions and run boot-completed.sh
if [ -f "$MODPATH/boot-completed.sh" ]; then
    chmod +x "$MODPATH/boot-completed.sh"
    sh "$MODPATH/boot-completed.sh" || echo -e "\e[31m[!] boot-completed.sh execution failed!\e[0m"
else
    echo -e "\e[31m[!] boot-completed.sh not found! Installation may be incomplete.\e[0m"
fi

echo -e "\e[32m[*] Installation completed!\e[0m"