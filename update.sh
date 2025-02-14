#!/system/bin/sh

MODPATH=/data/adb/modules/ksu-hide-prop
UPDATE_URL="https://github.com/Retr0680/ksu-hide-prop/archive/refs/heads/main.zip"
UPDATE_ZIP="/data/local/tmp/ksu-hide-prop-update.zip"
EXTRACT_PATH="/data/local/tmp/ksu-hide-prop-update"

# Notify user
echo "[*] Checking for updates..."

# Download latest module version
curl -L "$UPDATE_URL" -o "$UPDATE_ZIP"
if [ $? -ne 0 ]; then
    echo "[!] Failed to download update."
    exit 1
fi

# Remove old extracted files if exist
rm -rf "$EXTRACT_PATH"
mkdir -p "$EXTRACT_PATH"

# Extract new update
unzip -o "$UPDATE_ZIP" -d "$EXTRACT_PATH" > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "[!] Failed to extract update."
    exit 1
fi

# Copy new files to module directory
cp -rf "$EXTRACT_PATH"/* "$MODPATH"/
chmod -R 755 "$MODPATH"

# Ensure scripts have execute permissions
chmod +x "$MODPATH/install.sh"
chmod +x "$MODPATH/boot-completed.sh"

rm -rf "$UPDATE_ZIP" "$EXTRACT_PATH"

echo "[*] Update applied! Reboot to take effect."
exit 0