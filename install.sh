#!/system/bin/sh

clear  # Clears the screen for a clean look

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

# Check if update script exists before running
if [ -f "$MODPATH/update.sh" ]; then
    sh "$MODPATH/update.sh"
else
    echo "[!] Update script not found."
fi

# Check if boot-completed.sh exists before running
if [ -f "$MODPATH/boot-completed.sh" ]; then
    chmod +x "$MODPATH/boot-completed.sh"
    sh "$MODPATH/boot-completed.sh"
else
    echo "[!] boot-completed.sh not found!"
fi