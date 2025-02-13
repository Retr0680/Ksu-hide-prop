#!/system/bin/sh

echo "[*] Checking for updates from GitHub..."
LATEST_ZIP="https://github.com/Retr0680/Ksu-hide-prop/releases/latest/download/Ksu-hide-prop.zip"
MODULE_PATH="$MODPATH/Ksu-hide-prop.zip"

wget -O "$MODULE_PATH" "$LATEST_ZIP"
if [ $? -eq 0 ]; then
    echo "[*] Update downloaded successfully! Installing..."
    unzip -o "$MODULE_PATH" -d "$MODPATH"
    echo "[*] Update installed! Rebooting is recommended."
else
    echo "[!] Failed to download update. Check your internet connection."
fi