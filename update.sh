#!/system/bin/sh

# Define GitHub repo details
REPO_OWNER="Retr0680"
REPO_NAME="Ksu-hide-prop"
MODULE_ZIP="ksu-hide-prop.zip"
UPDATE_URL="https://github.com/$REPO_OWNER/$REPO_NAME/releases/latest/download/$MODULE_ZIP"

# Download the latest module ZIP
TMP_DIR="/sdcard/Download/KernelSU_Update"
mkdir -p $TMP_DIR
UPDATE_ZIP="$TMP_DIR/$MODULE_ZIP"

echo "[*] Downloading latest update from GitHub..."
curl -L -o "$UPDATE_ZIP" "$UPDATE_URL"

if [ $? -eq 0 ]; then
    echo "[✔] Download successful!"
else
    echo "[✘] Download failed. Check your internet connection."
    exit 1
fi

# Flash the module using Magisk (if installed)
if [ -f "/data/adb/magisk/busybox" ]; then
    echo "[*] Flashing the update with Magisk..."
    magisk --install-module "$UPDATE_ZIP"
    
    if [ $? -eq 0 ]; then
        echo "[✔] Update installed! Rebooting..."
        reboot
    else
        echo "[✘] Installation failed!"
    fi
else
    echo "[✘] Magisk not found! Install manually from: $UPDATE_ZIP"
fi