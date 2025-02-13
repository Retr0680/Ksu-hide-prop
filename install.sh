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

# Ensure MODPATH is correctly set
MODPATH=${0%/*}

echo -e "\e[32m[*] Checking for updates...\e[0m"
if [ -f "$MODPATH/update.sh" ]; then
    chmod +x "$MODPATH/update.sh"
    sh "$MODPATH/update.sh"
else
    echo -e "\e[31m[!] update.sh not found! Skipping update...\e[0m"
fi

# Set permissions and execute boot script
if [ -f "$MODPATH/boot-completed.sh" ]; then
    chmod +x "$MODPATH/boot-completed.sh"
    sh "$MODPATH/boot-completed.sh"
else
    echo -e "\e[31m[!] boot-completed.sh not found! Module may not work properly.\e[0m"
fi